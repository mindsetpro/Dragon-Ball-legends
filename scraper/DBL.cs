using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using HtmlAgilityPack;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

class CharacterData
{
    public string Name { get; set; }
    public string Rarity { get; set; }
    public string CharacterIdentifier { get; set; }
    public Dictionary<string, string> BaseStats { get; set; }
    public Dictionary<string, string> MaxStats { get; set; }
    public List<string> Tags { get; set; }
    public string MainAbility { get; set; }
    public string Element { get; set; }
    public string FullImg { get; set; }
    public bool IsLF { get; set; }
}

class Program
{
    static void Main(string[] args)
    {
        string baseURL = "https://dblegends.net/character/";
        string outputPath = Directory.GetCurrentDirectory();
        List<CharacterData> characters = new List<CharacterData>();

        for (int id = 1; id <= 599; id++)
        {
            string url = baseURL + id;
            string html = GetHtml(url);
            CharacterData character = ParseHtml(html);
            characters.Add(character);
        }

        // Save data to files
        SaveToCsv(characters, Path.Combine(outputPath, "characters.csv"));
        SaveToXml(characters, Path.Combine(outputPath, "characters.xml"));
        SaveToJson(characters, Path.Combine(outputPath, "characters.json"));
    }

    static string GetHtml(string url)
    {
        WebClient client = new WebClient();
        return client.DownloadString(url);
    }

    static CharacterData ParseHtml(string html)
    {
        HtmlDocument doc = new HtmlDocument();
        doc.LoadHtml(html);

        CharacterData character = new CharacterData();

        character.Name = doc.DocumentNode.SelectSingleNode("//div[@class='name']").InnerText;
        character.Rarity = doc.DocumentNode.SelectSingleNode("//div[contains(@class,'rarity')]").GetAttributeValue("class", "");
        character.CharacterIdentifier = doc.DocumentNode.SelectSingleNode("//div[@class='cardNUM']").InnerText;

        character.BaseStats = new Dictionary<string, string>();
        var baseStatsNodes = doc.DocumentNode.SelectNodes("//div[@id='BaseStats']//p");
        foreach (var node in baseStatsNodes)
        {
            string[] parts = node.InnerText.Split(':');
            character.BaseStats.Add(parts[0].Trim(), parts[1].Trim());
        }

        character.MaxStats = new Dictionary<string, string>();
        var maxStatsNodes = doc.DocumentNode.SelectNodes("//div[@id='MaxStats']//p");
        foreach (var node in maxStatsNodes)
        {
            string[] parts = node.InnerText.Split(':');
            character.MaxStats.Add(parts[0].Trim(), parts[1].Trim());
        }

        character.Tags = new List<string>();
        var tagsNodes = doc.DocumentNode.SelectNodes("//div[@class='trait-container']//div[@class='name']");
        foreach (var node in tagsNodes)
        {
            character.Tags.Add(node.InnerText);
        }

        character.MainAbility = doc.DocumentNode.SelectSingleNode("//p[starts-with(text(),'Now')]").InnerText;
        character.Element = doc.DocumentNode.SelectSingleNode("//div[contains(@class,'element')]").GetAttributeValue("class", "");
        character.FullImg = doc.DocumentNode.SelectSingleNode("//img").GetAttributeValue("src", "");
        character.IsLF = character.Rarity.Contains("LF");

        return character;
    }

    static void SaveToCsv(List<CharacterData> characters, string path)
    {
        StringBuilder csv = new StringBuilder();
        csv.AppendLine("Name,Rarity,Character Identifier,Base Stats,Max Stats,Tags,Main Ability,Element,Full Img,Is LF");

        foreach (var character in characters)
        {
            csv.AppendLine($"{character.Name},{character.Rarity},{character.CharacterIdentifier}," +
                           $"{DictionaryToString(character.BaseStats)},{DictionaryToString(character.MaxStats)}," +
                           $"{string.Join(", ", character.Tags)},{character.MainAbility}," +
                           $"{character.Element},{character.FullImg},{character.IsLF}");
        }

        File.WriteAllText(path, csv.ToString());
    }

    static void SaveToXml(List<CharacterData> characters, string path)
    {
        var serializer = new System.Xml.Serialization.XmlSerializer(typeof(List<CharacterData>));
        using (var stream = new StreamWriter(path))
        {
            serializer.Serialize(stream, characters);
        }
    }

    static void SaveToJson(List<CharacterData> characters, string path)
    {
        var json = JsonConvert.SerializeObject(characters, Formatting.Indented);
        File.WriteAllText(path, json);
    }

    static string DictionaryToString(Dictionary<string, string> dict)
    {
        return string.Join(", ", dict.Select(kv => $"{kv.Key}: {kv.Value}"));
    }
}
