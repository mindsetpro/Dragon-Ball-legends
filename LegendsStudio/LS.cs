using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;
using AssetStudio;

namespace DragonBallAssetViewer
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new MainForm());
        }
    }

    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
            ApplyDarkTheme();
        }

        private void ApplyDarkTheme()
        {
            // Modify the theme colors of the form
            this.BackColor = System.Drawing.Color.FromArgb(30, 30, 30);
            this.ForeColor = System.Drawing.Color.White;
            foreach (Control control in this.Controls)
            {
                if (control is DataGridView)
                {
                    ((DataGridView)control).BackgroundColor = System.Drawing.Color.FromArgb(50, 50, 50);
                    ((DataGridView)control).ForeColor = System.Drawing.Color.White;
                }
                else
                {
                    control.BackColor = System.Drawing.Color.FromArgb(50, 50, 50);
                    control.ForeColor = System.Drawing.Color.White;
                }
            }
        }

        private void LoadApk(string filePath)
        {
            if (File.Exists(filePath))
            {
                try
                {
                    // Load the APK file using AssetStudio
                    // Adjust this part to load the APK file with the correct method from AssetStudio
                    // For example:
                    // AssetStudio.AssetBundle.LoadFromFile(filePath);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error loading APK file: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("APK file not found.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

private void InitializeComponent()
{
    // Auto-generated code from the form designer
    this.SuspendLayout();
    // Add controls, set properties, etc.
    this.ResumeLayout(false);
}

        private void MainForm_Load(object sender, EventArgs e)
        {
            // Load the specified APK file
            LoadApk("DRAGON BALL LEGENDS_5.0.1_Apkpure.apk");
        }
    }
}
