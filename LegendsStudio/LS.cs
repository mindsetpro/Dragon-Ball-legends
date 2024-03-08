using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using AssetStudio;

namespace DragonBallAssetViewer
{
    static class Program
    {
        static void Main()
        {
            Console.WriteLine("DragonBall Asset Viewer");

            // Prompt user to select the APK file
            Console.WriteLine("Please provide the path to the APK file:");
            string filePath = Console.ReadLine();

            if (File.Exists(filePath))
            {
                try
                {
                    // Load the APK file using AssetStudio
                    AssetBundle ab = AssetBundle.LoadFromFile(filePath);

                    // Get all assets from the AssetBundle
                    var assets = ab.LoadAllAssets();

                    // Create a directory for storing assets
                    string assetDirectory = "assets";
                    Directory.CreateDirectory(assetDirectory);

                    // Dictionary to hold asset types and their corresponding directories
                    Dictionary<string, string> assetTypeDirectories = new Dictionary<string, string>();

                    // Loop through each asset and process them
                    foreach (var asset in assets)
                    {
                        // Create a directory for the asset type if it doesn't exist
                        if (!assetTypeDirectories.ContainsKey(asset.Type))
                        {
                            assetTypeDirectories[asset.Type] = Path.Combine(assetDirectory, asset.Type);
                            Directory.CreateDirectory(assetTypeDirectories[asset.Type]);
                        }

                        // Download and save the asset
                        string assetFileName = $"{asset.Name}.{asset.Type}";
                        string assetFilePath = Path.Combine(assetTypeDirectories[asset.Type], assetFileName);

                        DownloadAsset(asset, assetFilePath);

                        // Print progress
                        Console.WriteLine($"Downloaded asset: {assetFileName}");
                    }

                    Console.WriteLine("Download completed.");
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error loading APK file: " + ex.Message);
                }
            }
            else
            {
                Console.WriteLine("APK file not found.");
            }

            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }

        static void DownloadAsset(AssetPreloadData asset, string filePath)
        {
            using (WebClient webClient = new WebClient())
            {
                webClient.DownloadFile(asset.SourceFile.originalPath, filePath);
            }
        }
    }
}
