using AssetStudio;
using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

namespace DragonBallAssetViewer
{
    public partial class MainForm : Form
    {
        private AssetStudio.AssetStudioForm assetStudioForm;

        public MainForm()
        {
            InitializeComponent();
            InitializeAssetStudio();
            ApplyDarkTheme();
        }

        private void InitializeAssetStudio()
        {
            assetStudioForm = new AssetStudio.AssetStudioForm();
            assetStudioForm.Dock = DockStyle.Fill;
            this.Controls.Add(assetStudioForm);
        }

        private void ApplyDarkTheme()
        {
            // Modify the theme colors of AssetStudioForm
            assetStudioForm.BackColor = Color.FromArgb(30, 30, 30);
            assetStudioForm.ForeColor = Color.White;
            foreach (Control control in assetStudioForm.Controls)
            {
                if (control is DataGridView)
                {
                    ((DataGridView)control).BackgroundColor = Color.FromArgb(50, 50, 50);
                    ((DataGridView)control).ForeColor = Color.White;
                }
                else
                {
                    control.BackColor = Color.FromArgb(50, 50, 50);
                    control.ForeColor = Color.White;
                }
            }
        }

        private void LoadApk(string filePath)
        {
            if (File.Exists(filePath))
            {
                try
                {
                    assetStudioForm.LoadFile(filePath);
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

        private void MainForm_Load(object sender, EventArgs e)
        {
            // Load the specified APK file
            LoadApk("DRAGON BALL LEGENDS_5.0.1_Apkpure.apk");
        }
    }
}
