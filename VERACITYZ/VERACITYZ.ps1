$global:extait1fois = $false

#génération du rapport
Function ConvertTo-PDFFile
{
    Param
    (
        [string]$Source,
        [string]$Destionation
    )
 
    #Get the content of the file.
    $Source = Get-Content $Source -Encoding UTF8 -Raw;
 
    #Required Word Variables.
    $ExportFormat = 17;
    $SaveOption = 0
 
    #Create a hidden Word window.
    $WordObject = New-Object -ComObject word.application;
    $WordObject.Visible = $false;
 
    #Add a Word document.
    $DcoumentObject = $WordObject.Documents.Add();
 
    #Put the text into the Word document.
    $WordSelection = $WordObject.Selection;
    $WordSelection.TypeText($Source);
 
    #Set the page orientation to landscape.
    $DcoumentObject.PageSetup.Orientation = 0;
 
    #Export the PDF file and close without saving a Word document.
    $DcoumentObject.ExportAsFixedFormat($Destionation,$ExportFormat);
    $DcoumentObject.close([ref]$SaveOption);
    $WordObject.Quit();
    # Source de cette fonction : "http://blog.tofte-it.dk/powershell-convert-a-text-document-to-a-pdf/", consulté le 31 mars 2022 à 17h.
}

 function generer_rapport()
 {
    #afficher_chargement
    show_load
    masquer_menu
    
    [System.Windows.MessageBox]::Show('Génération du rapport PDF','Génération du rapport en PDF','ok','Information')
    write-log -chemin $logs -message "Génération du rapport"
    $DateAction2 = Get-Date -Format "dddd dd/MM/yyyy HH:mm"
    ADD-content -path $fichier -value "Génération du rapport effectué $DateAction2" -Encoding utf8
    
    ConvertTo-PDFFile -Source $fichier -Destionation "$PSScriptRoot\PDF\Rapport.pdf";
    #Renommage du rapport
    [string]$date = Get-Date -Format "dd-MM-yyyy-HH-mm-ss"
    [string]$name = "Rapport.pdf"
    [string]$file = "$date"+"_"+"$name"
    Rename-Item "$PSScriptRoot\PDF\Rapport.pdf" -NewName $file
    #Ouverture du rapport généré
    Invoke-Item "$PSScriptRoot\PDF\$file"
 }


    #variables globales ouvrir le shell
    
$global:software_folder = "$PSScriptRoot\Resource\platform-tools"
$global:runCmd ="cmd.exe"
$global:variable ="/k adb shell"

    #variables globales "extract one"
$global:folder = [string]"default_folder"
$global:file = $null

$global:folderUser = "/sdcard/"
$global:tmp = "dataExtractor_tmp"
$global:fullPath = "$folderUser$tmp"

#Cacher ou non les fenêtres WPF
function hide_load()
{
    $Window.FindName("barre_menu_chargement").Visibility = "Hidden"
    $Window.FindName("fenêtrechargement").Visibility = "Hidden"
    $Window.FindName("chargement").Visibility = "Hidden"
}
function show_load()
{
    $Window.FindName("barre_menu_chargement").Visibility = "Visible"
    $Window.FindName("fenêtrechargement").Visibility = "Visible"
    $Window.FindName("chargement").Visibility = "Visible"
}

function masquer_extract_one()
{
    $Window.FindName("barre_menu_extract_one").Visibility = "Hidden"
    $Window.FindName("exit_window").Visibility = "Hidden"
    $Window.FindName("extract_one").Visibility = "Hidden"
    $Window.FindName("Bouton_Parcourir").Visibility = "Hidden"
    $Window.FindName("path").Visibility = "Hidden"
    $Window.FindName("file_name").Visibility = "Hidden"
    $Window.FindName("Bouton_texte_Suivant").Visibility = "Hidden"
}
function afficher_extract_one()
{
    $Window.FindName("barre_menu_extract_one").Visibility = "Visible"
    $Window.FindName("exit_window").Visibility = "Visible"
    $Window.FindName("extract_one").Visibility = "Visible"
    $Window.FindName("Bouton_Parcourir").Visibility = "Visible"
    $Window.FindName("path").Visibility = "Visible"
    $Window.FindName("file_name").Visibility = "Visible"
    $Window.FindName("Bouton_texte_Suivant").Visibility = "Visible"
}

# cacher/masquer parcourir fichier
function masquer_parcourir_fichier()
{
    $Window.FindName("barre_menu_extract_one_window2").Visibility = "Hidden"
    $Window.FindName("exit_window2").Visibility = "Hidden"
    $Window.FindName("extract_one_window2").Visibility = "Hidden"
    $Window.FindName("file_name2").Visibility = "Hidden"
    $Window.FindName("path_android").Visibility = "Hidden"
    $Window.FindName("Bouton_texte_Suivant2").Visibility = "Hidden"
}
function afficher_parcourir_fichier()
{
    $Window.FindName("barre_menu_extract_one_window2").Visibility = "Visible"
    $Window.FindName("exit_window2").Visibility = "Visible"
    $Window.FindName("extract_one_window2").Visibility = "Visible"
    $Window.FindName("file_name2").Visibility = "Visible"
    $Window.FindName("path_android").Visibility = "Visible"
    $Window.FindName("Bouton_texte_Suivant2").Visibility = "Visible"
}

#Extraire par catégorie new
function masquer_extraire_par_categorie()
{
    $Window.FindName("barre_menu_extraire_par_categorie").Visibility = "Hidden"
    $Window.FindName("exit_window_categorie").Visibility = "Hidden"
    $Window.FindName("categorie").Visibility = "Hidden"
    $Window.FindName("menu_categorie").Visibility = "Hidden"
    $Window.FindName("menu_categorie2").Visibility = "Hidden"
    $Window.FindName("Bouton_cancel").Visibility = "Hidden"
    $Window.FindName("Bouton_select_all").Visibility = "Hidden"
    $Window.FindName("Bouton_cancel_select_all").Visibility = "Hidden"
    $Window.FindName("Bouton_texte_suivant_categorie_choix").Visibility = "Hidden"
}
function afficher_extraire_par_categorie()
{
    $Window.FindName("barre_menu_extraire_par_categorie").Visibility = "Visible"
    $Window.FindName("exit_window_categorie").Visibility = "Visible"
    $Window.FindName("categorie").Visibility = "Visible"
    $Window.FindName("menu_categorie").Visibility = "Visible"
    $Window.FindName("menu_categorie2").Visibility = "Visible"
    $Window.FindName("Bouton_cancel").Visibility = "Visible"
    $Window.FindName("Bouton_select_all").Visibility = "Visible"
    $Window.FindName("Bouton_texte_suivant_categorie_choix").Visibility = "Visible"
}

function masquer_select_folder_extract_by_categorie()
{
    $Window.FindName("barre_menu__select_folder_extract_by_categorie").Visibility = "Hidden"
    $Window.FindName("exit_window_select_folder_extract_by_categorie").Visibility = "Hidden"
    $Window.FindName("extract_by_categorie_select_folder").Visibility = "Hidden"
    $Window.FindName("Bouton_Parcourir_extract_by_categorie").Visibility = "Hidden"
    $Window.FindName("path_extract_by_categorie").Visibility = "Hidden"
    $Window.FindName("file_name1").Visibility = "Hidden"
    $Window.FindName("Bouton_texte_Suivant1").Visibility = "Hidden"
}
function afficher_select_folder_extract_by_categorie()
{
    $Window.FindName("barre_menu__select_folder_extract_by_categorie").Visibility = "Visible"
    $Window.FindName("exit_window_select_folder_extract_by_categorie").Visibility = "Visible"
    $Window.FindName("extract_by_categorie_select_folder").Visibility = "Visible"
    $Window.FindName("Bouton_Parcourir_extract_by_categorie").Visibility = "Visible"
    $Window.FindName("path_extract_by_categorie").Visibility = "Visible"
    $Window.FindName("file_name1").Visibility = "Visible"
    $Window.FindName("Bouton_texte_Suivant1").Visibility = "Visible"
}



#Couleur du fond
function fond_gris()
{
    $Window.FindName("fond_blanc1").Visibility = "Visible"
    $Window.FindName("fond_blanc2").Visibility = "Visible"
}

function fond_noir()
{
    $Window.FindName("fond_blanc1").Visibility = "Hidden"
    $Window.FindName("fond_blanc2").Visibility = "Hidden"
}

#Interface graphique
[xml]$XML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:Extractor_v1"
        Title="VERACITYZ" Height="1080" Width="1920">
    <Grid>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="59*"/>
            <ColumnDefinition Width="741*"/>
        </Grid.ColumnDefinitions>


        <!--Noir-->
        <Image x:Name="fond_noir" Grid.ColumnSpan="2" Margin="-1798,-14,-2042,-2" Source="$PSScriptRoot\Resource\Images\fond_noir.jpg" Stretch="Fill"/>

        <!--Blanc-->
        <Image x:Name="fond_blanc1" Grid.ColumnSpan="2" Margin="-1798,-14,-2042,-2" Source="$PSScriptRoot\Resource\Images\fond_blanc.jpg" Stretch="Fill"/>
        <Image x:Name="fond_blanc2" Grid.ColumnSpan="2" Margin="-1798,-14,-2042,-2" Source="$PSScriptRoot\Resource\Images\fond_noir.jpg" Stretch="Fill" Opacity="0.59"/>



        <!--Titre du programme-->
        <Label x:Name="Nom_logiciel" Grid.Column="1" Content="VERACITYZ" HorizontalAlignment="Left" Margin="670,110,0,0" VerticalAlignment="Top" HorizontalContentAlignment="Center" Foreground="#FFD2E2E1" FontFamily="Franklin Gothic Book" FontWeight="Bold" FontSize="60"/>
        <Label x:Name="Descriptif" Grid.Column="1" Content="EXTRACTEUR DE DONNEES MOBILES" HorizontalAlignment="Left" Margin="539,214,0,0" VerticalAlignment="Top" HorizontalContentAlignment="Center" Foreground="#FFD2E2E1" FontFamily="Franklin Gothic Book" FontWeight="Normal" FontSize="35"/>
        <Label x:Name="ligne" Grid.Column="1" Content="_________________________________________________________________________________" HorizontalAlignment="Left" Margin="454,264,0,0" VerticalAlignment="Top" HorizontalContentAlignment="Center" Foreground="#FFD2E2E1" FontFamily="Franklin Gothic Book" FontWeight="Normal" FontSize="35"/>

        <Menu x:Name="menu" Margin="631,428,474,58" Grid.Column="1" Cursor="Hand" Background="{x:Null}">

            <Button x:Name="extract_by_category" Content="Extraire par catégories" Height="39" Width="378" HorizontalAlignment="Center" Background="#FF1AA4B1" FontFamily="Dubai Medium" FontSize="20">
                <Button.Resources>
                    <Style TargetType="{x:Type Border}">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>

            <Button x:Name="extract" Content="Extraire un seul fichier ou dossier" Height="39" Width="378" HorizontalAlignment="Center" Background="#FF1AA4B1" FontFamily="Dubai Medium" FontSize="20">
                <Button.Resources>
                    <Style TargetType="{x:Type Border}">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>

            <Button x:Name="open_db" Content="Ouvrir un fichier" Height="39" Width="378" HorizontalAlignment="Center" Background="#FF1AA4B1" FontFamily="Dubai Medium" FontSize="20">
                <Button.Resources>
                    <Style TargetType="{x:Type Border}">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>

            <Button x:Name="fast_root" Content="Rootage rapide" Height="39" Width="378" HorizontalAlignment="Center" Background="#FF1AA4B1" FontFamily="Dubai Medium" FontSize="20">
                <Button.Resources>
                    <Style TargetType="{x:Type Border}">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>

            <Button x:Name="open_shell" Content="Ouvrir le shell du smartphone" Height="39" Width="378" HorizontalAlignment="Center" Background="#FF1AA4B1" FontFamily="Dubai Medium" FontSize="20">
                <Button.Resources>
                    <Style TargetType="{x:Type Border}">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>

            <Button x:Name="about" Content="A propos de VERACITYZ" Height="39" Width="378" HorizontalAlignment="Center" Background="#FF1AA4B1" FontFamily="Dubai Medium" FontSize="20">
                <Button.Resources>
                    <Style TargetType="{x:Type Border}">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>

            <Button x:Name="help" Content="Afficher l'aide" Height="39" Width="378" HorizontalAlignment="Center" Background="#FF1AA4B1" FontFamily="Dubai Medium" FontSize="20">
                <Button.Resources>
                    <Style TargetType="{x:Type Border}">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>

            <Button x:Name="rapport" Content="Générer un rapport d'extraction" Height="39" Width="378" HorizontalAlignment="Center" Background="#FF1AA4B1" FontFamily="Dubai Medium" FontSize="20">
                <Button.Resources>
                    <Style TargetType="{x:Type Border}">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>

            <Button x:Name="Exit" Content="Quitter" Height="39" Width="378" HorizontalAlignment="Center" Background="#FF1AA4B1" FontFamily="Dubai Medium" FontSize="20">
                <Button.Resources>
                    <Style TargetType="{x:Type Border}">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>

        </Menu>

        <Menu x:Name="menu_color" Margin="1546,906,41,10" Cursor="Hand" Background="{x:Null}" Grid.Column="1">
            <Button x:Name="black" Height="40" Width="40" HorizontalAlignment="Left" Background="Black" FontFamily="Dubai Medium" FontSize="20" Grid.Column="1">
                <Button.Resources>
                    <Style TargetType="{x:Type Border}">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>

            <Button x:Name="white" Height="40" Width="40" HorizontalAlignment="Left" Background="#FF969696" FontFamily="Dubai Medium" FontSize="20" Grid.Column="1">
                <Button.Resources>
                    <Style TargetType="{x:Type Border}">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>
        </Menu>


        <!-- fenêtre aide -->
        <TextBlock x:Name="barre_menu_aide1" Grid.Column="1" HorizontalAlignment="Left" Height="31" Margin="304,298,0,0" TextWrapping="NoWrap" Text="   Aide" VerticalAlignment="Top" Width="990" Background="White" FontFamily="Dubai Medium" FontSize="15"/>
        <TextBlock x:Name="aide" Grid.Column="1" HorizontalAlignment="Left" Height="452" Margin="304,328,0,0" TextWrapping="NoWrap" VerticalAlignment="Top" Width="990" Background="#FFD8D8D8" FontSize="15" FontFamily="Dubai Medium" TextAlignment="Justify" FontWeight="Bold"><Run/><LineBreak/><Run Text="   Ce programme est un extracteur de données didactique pour smartphone android"/><LineBreak/><Run/><LineBreak/><Run Text="   - Extraire par catégories : Liste de catégories à cocher afin d'extraire les données que vous souhaitez"/><LineBreak/><Run Text="   - Extraire un seul fichier ou dossier : Extraire un seul fichier de votre choix en indiquant son emplacement"/><LineBreak/><Run Text="   - Ouvrir un fichier : Permet d'ouvrir un fichier ou une base de données"/><LineBreak/><Run Text="   - Rootage rapide : Permet de directement obtenir les droits administrateur sur le smartphone. Cette action est requise afin d'extraire des données"/><LineBreak/><Run Text="   - Ouvrir le shell du smartphone : Permet d'accéder au terminal du smartphone"/><LineBreak/><Run Text="   - A propos de VERACITYZ : Donne des informations relatives au programme"/><LineBreak/><Run Text="   - Afficher l'aide : Ouvre cette fenêtre"/><LineBreak/><Run Text="   - Quitter : Ferme le programme et génère si demandé un rapport PDF des extractions effectuées"/><LineBreak/><Run Text=""/><LineBreak/><LineBreak/><Run Text="   ATTENTION : ce programme est prévu à des fins didactiques et non des enquêtes réelles"/><LineBreak/></TextBlock>
        <Button x:Name="Bouton_texte" Grid.Column="1" Content="OK" HorizontalAlignment="Left" Height="36" Margin="693,695,0,0" VerticalAlignment="Top" Width="211" Background="#FF1AA4B1" FontSize="15" FontFamily="Dubai Medium" FontWeight="Normal" FontStyle="Normal" Cursor="Hand"/>

        <!-- fenêtre about -->
        <TextBlock x:Name="barre_menu_about" Grid.Column="1" HorizontalAlignment="Left" Height="31" Margin="304,298,0,0" TextWrapping="NoWrap" Text="   A propos" VerticalAlignment="Top" Width="990" Background="White" FontFamily="Dubai Medium" FontSize="15"/>
        <TextBlock x:Name="bouton_about" Grid.Column="1" HorizontalAlignment="Left" Height="452" Margin="304,328,0,0" TextWrapping="NoWrap" VerticalAlignment="Top" Width="990" Background="#FFD8D8D8" FontSize="15" FontFamily="Dubai Medium" TextAlignment="Justify" FontWeight="Bold"><Run/><LineBreak/><Run Text="   A propos de VERACITYZ"/><LineBreak/><Run Text="   Année de création : 2022"/><LineBreak/><Run Text="   Ce programme a été créé dans le cadre d'un travail de fin d'études en sécurité des systèmes."/><LineBreak/><Run Text="   Unité où a été effectué le stage : Censuré"/><LineBreak/><Run Text="   Créateur du programme : Frédéric Grandgagnage"/><LineBreak/><Run Text="   Maitre de stage : Censuré"/><LineBreak/><Run Text="   Référent de stage : Censuré"/><LineBreak/><Run Text="   Ecole : Hénallux - IESN - Namur"/><LineBreak/><LineBreak/><Run Text=""/><LineBreak/><Run Text="   Source de l'image de fond : Image censuré"/><LineBreak/></TextBlock>
        <Button x:Name="Bouton_texte_about" Grid.Column="1" Content="OK" HorizontalAlignment="Left" Height="36" Margin="693,695,0,0" VerticalAlignment="Top" Width="211" Background="#FF1AA4B1" FontSize="15" FontFamily="Dubai Medium" FontWeight="Normal" FontStyle="Normal" Cursor="Hand"/>

        <!-- fenêtre de chargement -->
        <TextBlock x:Name="barre_menu_chargement" Grid.Column="1" HorizontalAlignment="Left" Height="31" Margin="304,298,0,0" TextWrapping="NoWrap" Text="   Chargement" VerticalAlignment="Top" Width="990" Background="White" FontFamily="Dubai Medium" FontSize="15"/>
        <TextBlock x:Name="fenêtrechargement" Grid.Column="1" HorizontalAlignment="Left" Height="452" Margin="304,328,0,0" TextWrapping="NoWrap" VerticalAlignment="Top" Width="990" Background="#FFD8D8D8" FontSize="15" FontFamily="Dubai Medium" TextAlignment="Justify" FontWeight="Bold" Text=""/>
        <ProgressBar x:Name="chargement" Grid.Column="1" HorizontalAlignment="Left" Height="52" Margin="562,532,0,0" VerticalAlignment="Top" Width="476" Value="0" IsIndeterminate="True"/>

        <!-- Extraire un seul fichier -->
        <TextBlock x:Name="barre_menu_extract_one" Grid.Column="1" HorizontalAlignment="Left" Height="31" Margin="304,298,0,0" TextWrapping="NoWrap" Text="   Extraire un fichier" VerticalAlignment="Top" Width="990" Background="White" FontFamily="Dubai Medium" FontSize="15"/>
        <Button x:Name="exit_window" Grid.Column="1" Content="X" HorizontalAlignment="Left" Height="32" Margin="1263,297,0,0" VerticalAlignment="Top" Width="32" Background="#FFBB0D0D" FontSize="15" FontFamily="Verdana" BorderBrush="{x:Null}" Cursor="Hand"/>
        <TextBlock x:Name="extract_one" Grid.Column="1" HorizontalAlignment="Left" Height="452" Margin="304,328,0,0" TextWrapping="NoWrap" VerticalAlignment="Top" Width="990" Background="#FFD8D8D8" FontSize="15" FontFamily="Dubai Medium" TextAlignment="Justify" FontWeight="Bold"><Run/><LineBreak/><Run Text="   Veuillez selectionner le dossier dans lequel sera placé votre extraction."/><LineBreak/><Run Text=" "/></TextBlock>
        <Button x:Name="Bouton_Parcourir" Grid.Column="1" Content="Parcourir" HorizontalAlignment="Left" Height="36" Margin="1053,695,0,0" VerticalAlignment="Top" Width="211" Background="#FF1AA4B1" FontSize="15" FontFamily="Dubai Medium" FontWeight="Normal" FontStyle="Normal" Cursor="Hand"/>
        <RichTextBox x:Name="path" Grid.Column="1" HorizontalAlignment="Left" Height="36" Margin="389,695,0,0" VerticalAlignment="Top" Width="631" FontStyle="Normal" Cursor="IBeam">
            <FlowDocument>
                <Paragraph>
                    <Run x:Name="the_text" Text="$global:folder"/> 
                </Paragraph>
            </FlowDocument>
        </RichTextBox>
        <TextBlock x:Name="file_name" Grid.Column="1" HorizontalAlignment="Left" Margin="322,692,0,0" TextWrapping="Wrap" Text="Chemin :" VerticalAlignment="Top" FontFamily="Dubai Medium" FontSize="15"/>
        <Button x:Name="Bouton_texte_Suivant" Grid.Column="1" Content="Suivant" HorizontalAlignment="Left" Height="36" Margin="1053,737,0,0" VerticalAlignment="Top" Width="211" Background="#FF1AA4B1" FontSize="15" FontFamily="Dubai Medium" FontWeight="Normal" FontStyle="Normal" Cursor="Hand"/>
        
        <!-- fenêtre parcourir fichier -->
        <TextBlock x:Name="barre_menu_extract_one_window2" Grid.Column="1" HorizontalAlignment="Left" Height="31" Margin="304,298,0,0" TextWrapping="NoWrap" Text="   Extraire un fichier" VerticalAlignment="Top" Width="990" Background="White" FontFamily="Dubai Medium" FontSize="15"/>
        <Button x:Name="exit_window2" Grid.Column="1" Content="X" HorizontalAlignment="Left" Height="32" Margin="1263,297,0,0" VerticalAlignment="Top" Width="32" Background="#FFBB0D0D" FontSize="15" FontFamily="Verdana" BorderBrush="{x:Null}" Cursor="Hand"/>
        <TextBlock x:Name="extract_one_window2" Grid.Column="1" HorizontalAlignment="Left" Height="452" Margin="304,328,0,0" TextWrapping="NoWrap" VerticalAlignment="Top" Width="990" Background="#FFD8D8D8" FontSize="15" FontFamily="Dubai Medium" TextAlignment="Justify" FontWeight="Bold"><Run/><LineBreak/><Run Text="   "/><Run Language="fr-be" Text="Veuillez indiquer le chemin du fichier ou dossier que vous désirez extraire."/><LineBreak/><Run Text=" "/></TextBlock>
        <TextBlock x:Name="file_name2" Grid.Column="1" HorizontalAlignment="Left" Margin="324,692,0,0" TextWrapping="Wrap" Text="Fichier :" VerticalAlignment="Top" FontFamily="Dubai Medium" FontSize="15"/>
        <RichTextBox x:Name="path_android" Grid.Column="1" HorizontalAlignment="Left" Height="36" Margin="389,695,0,0" VerticalAlignment="Top" Width="631" FontStyle="Normal" Cursor="IBeam">
            <FlowDocument>
                <Paragraph>
                    <Run x:Name="barre_recherche" Text="$global:file"/>
                </Paragraph>
            </FlowDocument>
        </RichTextBox>

        <Button x:Name="Bouton_texte_Suivant2" Grid.Column="1" Content="Suivant" HorizontalAlignment="Left" Height="36" Margin="1053,695,0,0" VerticalAlignment="Top" Width="211" Background="#FF1AA4B1" FontSize="15" FontFamily="Dubai Medium" FontWeight="Normal" FontStyle="Normal" Cursor="Hand"/>


<!-- Extraire par catégorie -->
        <TextBlock x:Name="barre_menu_extraire_par_categorie" Grid.Column="1" HorizontalAlignment="Left" Height="31" Margin="304,298,0,0" TextWrapping="NoWrap" Text="   Categories" VerticalAlignment="Top" Width="990" Background="White" FontFamily="Dubai Medium" FontSize="15"/>
        <Button x:Name="exit_window_categorie" Grid.Column="1" Content="X" HorizontalAlignment="Left" Height="32" Margin="1263,297,0,0" VerticalAlignment="Top" Width="32" Background="#FFBB0D0D" FontSize="15" FontFamily="Verdana" BorderBrush="{x:Null}" Cursor="Hand"/>

        <TextBlock x:Name="categorie" Grid.Column="1" HorizontalAlignment="Left" Height="452" Margin="304,328,0,0" TextWrapping="NoWrap" VerticalAlignment="Top" Width="990" Background="#FFD8D8D8" FontSize="15" FontFamily="Dubai Medium" TextAlignment="Justify" FontWeight="Bold"><Run/><LineBreak/><Run Text="   Veuillez selectionner les données que vous désirez extraire."/></TextBlock>

        <Menu x:Name="menu_categorie" Margin="341,400,1239,377" Grid.Column="1" Background="{x:Null}">
            <CheckBox x:Name="about_owner" Content="A propos du propriétaire" FontSize="14"/>
            <CheckBox x:Name="agenda" Content="Agenda" FontSize="14"/>
            <CheckBox x:Name="appels" Content="Appels             " FontSize="14"/>
            <CheckBox x:Name="capteurs" Content="Capteurs" FontSize="14"/>
            <CheckBox x:Name="contacts" Content="Contacts          " FontSize="14"/>
            <CheckBox x:Name="cookies" Content="Cookies" FontSize="14"/>
            <CheckBox x:Name="deplacements" Content="Déplacements" FontSize="14"/>
            <CheckBox x:Name="mails" Content="E-mails            " FontSize="14"/>
            <CheckBox x:Name="actualite" Content="Fil d'actualité" FontSize="14"/>
            <CheckBox x:Name="historique" Content="Historique internet" FontSize="14"/>
        </Menu>

        <Menu x:Name="menu_categorie2" Margin="572,400,991,377" Grid.Column="1" Background="{x:Null}">
            <CheckBox x:Name="ID" Content="Identifiants de connexion" FontSize="14"/>
            <CheckBox x:Name="icc" Content="International Circuit Card" FontSize="14"/>
            <CheckBox x:Name="logs" Content="Journaux d'évènements" FontSize="14"/>
            <CheckBox x:Name="appslist" Content="Liste des applications" FontSize="14"/>
            <CheckBox x:Name="media" Content="Médias" FontSize="14"/>
            <CheckBox x:Name="messages" Content="Messages               " FontSize="14"/>
            <CheckBox x:Name="notes" Content="Notes" FontSize="14"/>
            <CheckBox x:Name="periodesdactivite" Content="Périodes d'activitée" FontSize="14"/>
            <CheckBox x:Name="recherches" Content="Recherches" FontSize="14"/>
            <CheckBox x:Name="telechargements" Content="Téléchargements" FontSize="14"/>
        </Menu>



        <Button x:Name="Bouton_cancel" Grid.Column="1" Content="Annuler" HorizontalAlignment="Left" Height="36" Margin="339,715,0,0" VerticalAlignment="Top" Width="211" Background="#FF1AA4B1" FontSize="15" FontFamily="Dubai Medium" FontWeight="Normal" FontStyle="Normal" Cursor="Hand"/>
        <Button x:Name="Bouton_select_all" Grid.Column="1" Content="Tout sélectionner" HorizontalAlignment="Left" Height="36" Margin="693,715,0,0" VerticalAlignment="Top" Width="211" Background="#FF1AA4B1" FontSize="15" FontFamily="Dubai Medium" FontWeight="Normal" FontStyle="Normal" Cursor="Hand"/>
        <Button x:Name="Bouton_cancel_select_all" Grid.Column="1" Content="Tout désélectionner" HorizontalAlignment="Left" Height="36" Margin="693,715,0,0" VerticalAlignment="Top" Width="211" Background="#FF1AA4B1" FontSize="15" FontFamily="Dubai Medium" FontWeight="Normal" FontStyle="Normal" Cursor="Hand"/>
        <Button x:Name="Bouton_texte_suivant_categorie_choix" Grid.Column="1" Content="Extraire la selection" HorizontalAlignment="Left" Height="36" Margin="1050,715,0,0" VerticalAlignment="Top" Width="211" Background="#FF1AA4B1" FontSize="15" FontFamily="Dubai Medium" FontWeight="Normal" FontStyle="Normal" Cursor="Hand"/>

<!-- Extraire plusieurs fichier -->
        <TextBlock x:Name="barre_menu__select_folder_extract_by_categorie" Grid.Column="1" HorizontalAlignment="Left" Height="31" Margin="304,298,0,0" TextWrapping="NoWrap" Text="   Extraire par catégories" VerticalAlignment="Top" Width="990" Background="White" FontFamily="Dubai Medium" FontSize="15"/>
        <Button x:Name="exit_window_select_folder_extract_by_categorie" Grid.Column="1" Content="X" HorizontalAlignment="Left" Height="32" Margin="1263,297,0,0" VerticalAlignment="Top" Width="32" Background="#FFBB0D0D" FontSize="15" FontFamily="Verdana" BorderBrush="{x:Null}" Cursor="Hand"/>
        <TextBlock x:Name="extract_by_categorie_select_folder" Grid.Column="1" HorizontalAlignment="Left" Height="452" Margin="304,328,0,0" TextWrapping="NoWrap" VerticalAlignment="Top" Width="990" Background="#FFD8D8D8" FontSize="15" FontFamily="Dubai Medium" TextAlignment="Justify" FontWeight="Bold"><Run/><LineBreak/><Run Text="   Veuillez selectionner le dossier dans lequel seront placé vos extractions."/><LineBreak/><Run Text=" "/></TextBlock>
        <Button x:Name="Bouton_Parcourir_extract_by_categorie" Grid.Column="1" Content="Parcourir" HorizontalAlignment="Left" Height="36" Margin="1053,695,0,0" VerticalAlignment="Top" Width="211" Background="#FF1AA4B1" FontSize="15" FontFamily="Dubai Medium" FontWeight="Normal" FontStyle="Normal" Cursor="Hand"/>
        <RichTextBox x:Name="path_extract_by_categorie" Grid.Column="1" HorizontalAlignment="Left" Height="36" Margin="389,695,0,0" VerticalAlignment="Top" Width="631" FontStyle="Normal" Cursor="IBeam">
            <FlowDocument>
                <Paragraph>
                    <Run x:Name="the_text_extract_by_categorie" Text="$global:folder"/>
                </Paragraph>
            </FlowDocument>
        </RichTextBox>
        <TextBlock x:Name="file_name1" Grid.Column="1" HorizontalAlignment="Left" Margin="322,692,0,0" TextWrapping="Wrap" Text="Chemin :" VerticalAlignment="Top" FontFamily="Dubai Medium" FontSize="15"/>
        <Button x:Name="Bouton_texte_Suivant1" Grid.Column="1" Content="Suivant" HorizontalAlignment="Left" Height="36" Margin="1053,737,0,0" VerticalAlignment="Top" Width="211" Background="#FF1AA4B1" FontSize="15" FontFamily="Dubai Medium" FontWeight="Normal" FontStyle="Normal" Cursor="Hand"/>

    </Grid>
</Window>
"@

#Prérequis pour l'interface graphique
Add-Type -AssemblyName PresentationFramework
$FormXML = (New-Object System.Xml.XmlNodeReader $XML)
$Window = [Windows.Markup.XamlReader]::Load($FormXML)

# couleurs
$Window.FindName("black").add_click({
    write-log -chemin $logs -message "Couleur choisie : noir"
    fond_noir
})

$Window.FindName("white").add_click({
    write-log -chemin $logs -message "Couleur choisie : gris"
    fond_gris
})

# -- extraire par catégorie --
$Window.FindName("Bouton_texte_Suivant1").add_click({
    $global:folder = $Window.FindName("the_text_extract_by_categorie").("Text")

        # Si l'utilisateur ne rentre aucun nom de dossier dans la barre de recherche et clique sur suivant, il y aura une erreur.
        # Le dossier sera alors "default_folder".
    if($global:folder -eq ""){
        [System.Windows.MessageBox]::Show('Le résultat sera placé dans le repertoire par défaut : default_folder','Information','ok','Information')
        $global:folder = "default_folder"
    } 

    [System.Windows.MessageBox]::Show("Le dossier est à présent : $global:folder")

    write-log -chemin $logs -message "Le dossier de destination est $global:folder"

    masquer_select_folder_extract_by_categorie
    afficher_extraire_par_categorie
})

function select_file_extract_by_category()
{
    Add-Type -AssemblyName System.Windows.Forms
    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Sélectionnez un dossier"
    $foldername.SelectedPath = $mydocuments = [environment]::getfolderpath("mydocuments")

    if($foldername.ShowDialog() -eq "OK")
    {
        $global:folder = $foldername.SelectedPath
        [System.Windows.MessageBox]::Show("Le dossier est à présent : $global:folder")

        write-log -chemin $logs -message "Le dossier de destination est $global:folder"
        ADD-content -path $fichier -value "Le répertoire de destination choisi est : $global:folder" -Encoding utf8

        masquer_select_folder_extract_by_categorie
        afficher_extraire_par_categorie
    }
}

$Window.FindName("Bouton_Parcourir_extract_by_categorie").add_click({
    select_file_extract_by_category
})

masquer_select_folder_extract_by_categorie

$Window.FindName("exit_window_select_folder_extract_by_categorie").add_click({
    masquer_select_folder_extract_by_categorie
    afficher_menu
})


# --- EXTRAIRE PAR CATEGORIE ---
masquer_extraire_par_categorie

$Window.FindName("extract_by_category").add_click({

write-log -chemin $logs -message "- Extraire par catégorie -"
ADD-content -path $fichier -value "Extraction par catégorie" -Encoding utf8

#___ Vérifie la présence du smartphone
    cd $software_folder
    .\adb shell ls

    if($LASTEXITCODE -eq 0)
    {
        [System.Windows.MessageBox]::Show('Cette action va alterer la mémoire du smartphone.','Attention','OK','Warning')
        masquer_menu
        afficher_select_folder_extract_by_categorie
        selectionner_extraire_par_categorie
    } else {
        write-log -chemin $logs -message "Erreur : smartphone non trouvé"
        [System.Windows.MessageBox]::Show('Erreur : Smartphone non trouvé','Erreur','ok','Error')
        $msgBoxInputAskFastRoot = [System.Windows.MessageBox]::Show('Voulez-vous effectuer un root rapide ?','Root rapide ?','YesNo','Question')

     switch  ($msgBoxInputAskFastRoot)
        {
        'Yes'
            {
            fast_root
            }
        }
    }
})

function selectionner_extraire_par_categorie()
{
#Gauche

$Window.FindName("about_owner").add_checked({
    $global:about_owner = $true
})
$Window.FindName("about_owner").add_unchecked({
    $global:about_owner = $false
})

$Window.FindName("agenda").add_checked({
    $global:agenda = $true
})
$Window.FindName("agenda").add_unchecked({
    $global:agenda = $false
})

$Window.FindName("appels").add_checked({
    $global:appels = $true
})
$Window.FindName("appels").add_unchecked({
    $global:appels = $false
})

$Window.FindName("capteurs").add_checked({
    $global:capteurs = $true
})
$Window.FindName("capteurs").add_unchecked({
    $global:capteurs = $false
})

$Window.FindName("contacts").add_checked({
    $global:contacts = $true
})
$Window.FindName("contacts").add_unchecked({
    $global:contacts = $false
})

$Window.FindName("cookies").add_checked({
    $global:cookies = $true
})
$Window.FindName("cookies").add_unchecked({
    $global:cookies = $false
})

$Window.FindName("deplacements").add_checked({
    $global:deplacements = $true
})
$Window.FindName("deplacements").add_unchecked({
    $global:deplacements = $false
})

$Window.FindName("mails").add_checked({
    $global:mails = $true
})
$Window.FindName("mails").add_unchecked({
    $global:mails = $false
})

$Window.FindName("actualite").add_checked({
    $global:actualite = $true
})
$Window.FindName("actualite").add_unchecked({
    $global:actualite = $false
})

$Window.FindName("historique").add_checked({
    $global:historique = $true
})
$Window.FindName("historique").add_unchecked({
    $global:historique = $false
})

#Droite

$Window.FindName("ID").add_checked({
    $global:ID = $true
})
$Window.FindName("ID").add_unchecked({
    $global:ID = $false
})

$Window.FindName("icc").add_checked({
    $global:icc = $true
})
$Window.FindName("icc").add_unchecked({
    $global:icc = $false
})

$Window.FindName("logs").add_checked({
    $global:logs = $true
})
$Window.FindName("logs").add_unchecked({
    $global:logs = $false
})

$Window.FindName("appslist").add_checked({
    $global:appslist = $true
})
$Window.FindName("appslist").add_unchecked({
    $global:appslist = $false
})

$Window.FindName("media").add_checked({
    $global:media = $true
})
$Window.FindName("media").add_unchecked({
    $global:media = $false
})

$Window.FindName("messages").add_checked({
    $global:messages = $true
})
$Window.FindName("messages").add_unchecked({
    $global:messages = $false
})

$Window.FindName("notes").add_checked({
    $global:notes = $true
})
$Window.FindName("notes").add_unchecked({
    $global:notes = $false
})

$Window.FindName("periodesdactivite").add_checked({
    $global:periodesdactivite = $true
})
$Window.FindName("periodesdactivite").add_unchecked({
    $global:periodesdactivite = $false
})

$Window.FindName("recherches").add_checked({
    $global:recherches = $true
})
$Window.FindName("recherches").add_unchecked({
    $global:recherches = $false
})

$Window.FindName("telechargements").add_checked({
    $global:telechargements = $true
})
$Window.FindName("telechargements").add_unchecked({
    $global:telechargements = $false
})

}


#select all
$Window.FindName("Bouton_cancel_select_all").Visibility = "Hidden"

$Window.FindName("Bouton_select_all").add_click({
    write-log -chemin $logs -message "Vous avez cliqué sur ''Tout sélectionner''"

    $Window.FindName("about_owner").IsChecked = $true
    $Window.FindName("agenda").IsChecked = $true
    $Window.FindName("appels").IsChecked = $true
    $Window.FindName("capteurs").IsChecked = $true
    $Window.FindName("contacts").IsChecked = $true
    $Window.FindName("cookies").IsChecked = $true
    $Window.FindName("deplacements").IsChecked = $true
    $Window.FindName("mails").IsChecked = $true
    $Window.FindName("actualite").IsChecked = $true
    $Window.FindName("historique").IsChecked = $true

    $Window.FindName("ID").IsChecked = $true
    $Window.FindName("icc").IsChecked = $true
    $Window.FindName("logs").IsChecked = $true
    $Window.FindName("appslist").IsChecked = $true
    $Window.FindName("media").IsChecked = $true
    $Window.FindName("messages").IsChecked = $true
    $Window.FindName("notes").IsChecked = $true
    $Window.FindName("periodesdactivite").IsChecked = $true
    $Window.FindName("recherches").IsChecked = $true
    $Window.FindName("telechargements").IsChecked = $true

    $Window.FindName("Bouton_cancel_select_all").Visibility = "Visible"
})

$Window.FindName("Bouton_cancel_select_all").add_click({
    write-log -chemin $logs -message "Vous avez cliqué sur ''Tout désélectionner''"

    $Window.FindName("about_owner").IsChecked = $false
    $Window.FindName("agenda").IsChecked = $false
    $Window.FindName("appels").IsChecked = $false
    $Window.FindName("capteurs").IsChecked = $false
    $Window.FindName("contacts").IsChecked = $false
    $Window.FindName("cookies").IsChecked = $false
    $Window.FindName("deplacements").IsChecked = $false
    $Window.FindName("mails").IsChecked = $false
    $Window.FindName("actualite").IsChecked = $false
    $Window.FindName("historique").IsChecked = $false

    $Window.FindName("ID").IsChecked = $false
    $Window.FindName("icc").IsChecked = $false
    $Window.FindName("logs").IsChecked = $false
    $Window.FindName("appslist").IsChecked = $false
    $Window.FindName("media").IsChecked = $false
    $Window.FindName("messages").IsChecked = $false
    $Window.FindName("notes").IsChecked = $false
    $Window.FindName("periodesdactivite").IsChecked = $false
    $Window.FindName("recherches").IsChecked = $false
    $Window.FindName("telechargements").IsChecked = $false

    $Window.FindName("Bouton_cancel_select_all").Visibility = "Hidden"
})


$Window.FindName("Bouton_texte_suivant_categorie_choix").add_click({
    show_load
    masquer_extraire_par_categorie
    [System.Windows.MessageBox]::Show("Début des opérations")

    $software_folder = "$PSScriptRoot\Resource\platform-tools"
    cd $software_folder
    .\adb shell mkdir -p $global:fullPath
    New-Item -Path $global:folder -ItemType Directory -Force

#Gauche

    if($global:about_owner){
        #[System.Windows.MessageBox]::Show("Diverses informations sur le propriétaire vont être être extraites")
        write-log -chemin $logs -message "Diverses informations sur le propriétaire vont être être extraites"

        .\adb shell ls "/data/data/com.tinder/files/datastore/user_interests"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.tinder/files/datastore/user_interests' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.tinder/files/datastore/user_interests'"
            .\adb shell mkdir -p $global:fullPath/"A_propos_du_propriétaire"/"Tinder"
            .\adb shell cp -r "/data/data/com.tinder/files/datastore/user_interests" $global:fullPath/"A_propos_du_propriétaire"/"Tinder"

            ADD-content -path $fichier -value "- A propos du propriétaire -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.tinder/files/datastore/user_interests'" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'A_propos_du_propriétaire/Tinder'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Loisirs du possesseur du compte Tinder" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        .\adb shell ls "/data/data/com.tinder/files/datastore/account"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.tinder/files/datastore/account' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.tinder/files/datastore/account'"
            .\adb shell mkdir -p $global:fullPath/"A_propos_du_propriétaire"/"Tinder"
            .\adb shell cp -r "/data/data/com.tinder/files/datastore/account" $global:fullPath/"A_propos_du_propriétaire"/"Tinder"

            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.tinder/files/datastore/account'" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'A_propos_du_propriétaire/Tinder'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Numéro de téléphone et adresse e-mail du possesseur du compte Tinder" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("Les informations sur le propriétaire ne seront pas extraites")
        write-log -chemin $logs -message "Les informations sur le propriétaire ne seront pas extraites"
    }

    if($global:agenda){
        #[System.Windows.MessageBox]::Show("L'agenda va être extrait")
        write-log -chemin $logs -message "L'agenda va être extrait"

        .\adb shell ls "/data/data/com.google.android.calendar/databases/cal_v2a"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.google.android.calendar/databases/cal_v2a' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.google.android.calendar/databases/cal_v2a'"
            .\adb shell mkdir -p $global:fullPath/"Agenda"/"Google_agenda"
            .\adb shell cp -r "/data/data/com.google.android.calendar/databases/cal_v2a" $global:fullPath/"Agenda"/"Google_agenda"

            ADD-content -path $fichier -value "- Google Agenda -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.google.android.calendar/databases/cal_v2a'" -Encoding utf8
            ADD-content -path $fichier -value "Table : Events" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Agenda/Google_agenda'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Accès aux évènements du calendrier" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("L'agenda ne va pas être extrait")
        write-log -chemin $logs -message "L'agenda ne va pas être extrait"
    }

    if($global:appels){
        #[System.Windows.MessageBox]::Show("Les appels vont être extraits")
        write-log -chemin $logs -message "Les appels vont être extraits"

        .\adb shell ls "/data/data/com.android.providers.contacts/databases/calllog.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.android.providers.contacts/databases/calllog.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.android.providers.contacts/databases/calllog.db'"
            .\adb shell mkdir -p $global:fullPath/"Appels"/"Appels_du_smartphone"
            .\adb shell cp -r "/data/data/com.android.providers.contacts/databases/calllog.db" $global:fullPath/"Appels"/"Appels_du_smartphone"

            ADD-content -path $fichier -value "- Appels -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.android.providers.contacts/databases/calllog.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : calls" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Appels/Appels_du_smartphone'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Appels passés" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

    } else {
        #[System.Windows.MessageBox]::Show("Les appels ne seront pas extraits")
        write-log -chemin $logs -message "Les appels ne seront pas extraits"
    }

    if($global:capteurs){
        #[System.Windows.MessageBox]::Show("Les capteurs vont être extraits")
        write-log -chemin $logs -message "Les capteurs vont être extraits"

        # On vérifie l'existance du fichier. Si erreurn on ne le déplace pas.
        .\adb shell ls "/data/data/com.wered.sensorsmultitool/databases/shotsDB"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.wered.sensorsmultitool/databases/shotsDB' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.wered.sensorsmultitool/databases/shotsDB'"
            .\adb shell mkdir -p $global:fullPath/"capteur"/"Sensormultitool"
            .\adb shell cp -r "/data/data/com.wered.sensorsmultitool/databases/shotsDB" $global:fullPath/"capteur"/"Sensormultitool"

            ADD-content -path $fichier -value "- Capteurs (Sensors) -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.wered.sensorsmultitool/databases/shotsDB'" -Encoding utf8
            ADD-content -path $fichier -value "Table : SM_SHOT" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'capteur/Sensormultitool'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Mesures des différents capteurs" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("Les capteurs ne seront pas extraits")
        write-log -chemin $logs -message "Les capteurs ne seront pas extraits"
    }

    if($global:contacts){
        #[System.Windows.MessageBox]::Show("Les contacts vont être extraits")
        write-log -chemin $logs -message "Les contacts vont être extraits"

        #Contacts Google
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.android.providers.contacts/databases/contacts2.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.android.providers.contacts/databases/contacts2.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.android.providers.contacts/databases/contacts2.db'"
            .\adb shell mkdir -p $global:fullPath/"Contacts"/"Contacts_du_smartphone"
            .\adb shell cp -r "/data/data/com.android.providers.contacts/databases/contacts2.db" $global:fullPath/"Contacts"/"Contacts_du_smartphone"

            ADD-content -path $fichier -value "- Contacts -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.android.providers.contacts/databases/contacts2.db'" -Encoding utf8
            ADD-content -path $fichier -value "Tables : _sync_state | accounts | view_contacts | view_data" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Contacts/Contacts_du_smartphone'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Compte Google associé | Liste des différents comptes associés | Noms des contacts et dernières fois qu'ils ont été contactés | Noms des contacts et dernières fois qu'ils ont été contactés plus détailés" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        #COntacts WhatsApp
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.whatsapp/databases/wa.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.whatsapp/databases/wa.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.whatsapp/databases/wa.db'"
            .\adb shell mkdir -p $global:fullPath/"Contacts"/"WhatsApp"
            .\adb shell cp -r "/data/data/com.whatsapp/databases/wa.db" $global:fullPath/"Contacts"/"WhatsApp"

            ADD-content -path $fichier -value " Contacts WatsApp" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.whatsapp/databases/wa.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : wa_contacts" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Contacts/WhatsApp'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Liste des contacts WhatsApp" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.whatsapp/databases/axolotl.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.whatsapp/databases/axolotl.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.whatsapp/databases/axolotl.db'"
            .\adb shell mkdir -p $global:fullPath/"Contacts"/"WhatsApp"
            .\adb shell cp -r "/data/data/com.whatsapp/databases/axolotl.db" $global:fullPath/"Contacts"/"WhatsApp"

            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.whatsapp/databases/axolotl.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : identities" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Contacts/WhatsApp'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Numéro de téléphone des contacts" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        #Contacts Facebook

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.facebook.katana/databases/contacts_db2"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.facebook.katana/databases/contacts_db2' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.facebook.katana/databases/contacts_db2'"
            .\adb shell mkdir -p $global:fullPath/"Contacts"/"Facebook"
            .\adb shell cp -r "/data/data/com.facebook.katana/databases/contacts_db2" $global:fullPath/"Contacts"/"Facebook"

            ADD-content -path $fichier -value " Contacts Facebook" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.facebook.katana/databases/contacts_db2'" -Encoding utf8
            ADD-content -path $fichier -value "Table : contacts" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Contacts/Facebook'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Relations proches ou éloignées Facebook" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        #Contacts Messenger

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.facebook.orca/databases/msys_database_1120352237"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.facebook.orca/databases/msys_database_1120352237' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.facebook.orca/databases/msys_database_1120352237'"
            .\adb shell mkdir -p $global:fullPath/"Contacts"/"Messenger"
            .\adb shell cp -r "/data/data/com.facebook.orca/databases/msys_database_1120352237" $global:fullPath/"Contacts"/"Messenger"

            ADD-content -path $fichier -value " Contacts Messenger" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.facebook.orca/databases/msys_database_1120352237'" -Encoding utf8
            ADD-content -path $fichier -value "Table : all_contacts_plus_ranking | contacts | _self_thread_name | crypto_auth_token | family_experiences | fb_unified_contacts | secure_message_other_devices | secure_message_peer_devices_v2 | unified_client_contacts" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Contacts/Messenger'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Liste des contacts, y compris ceux bloqués + le rank | Semblable à la table 'all_contacts_plus_ranking', sauf qu'on sait voir depuis quand quelqu'un est bloqué | Nom et prénom du possesseur du compte | Token de connexion | Lien entre le compte Facebook et Instagram | Est aussi une liste de contacts. Elle nous donne des infos qu’on avait déjà avant, mais nous donne « l’username » en plus. | Indique le nom des téléphones où est connecté Messenger | Indique le nom des téléphonne où est connecté Messenger + lieu et adresse IP | Liste des contacts" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        #Contacts Gmail
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.google.android.gm/databases/peopleCache_comptedetestgsm@gmail.com_com.google_11.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.google.android.gm/databases/peopleCache_comptedetestgsm@gmail.com_com.google_11.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.google.android.gm/databases/peopleCache_comptedetestgsm@gmail.com_com.google_11.db'"
            .\adb shell mkdir -p $global:fullPath/"Contacts"/"Gmail"
            .\adb shell cp -r "/data/data/com.google.android.gm/databases/peopleCache_comptedetestgsm@gmail.com_com.google_11.db" $global:fullPath/"Contacts"/"Gmail"

            ADD-content -path $fichier -value " Contacts Gmail" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.google.android.gm/databases/peopleCache_comptedetestgsm@gmail.com_com.google_11.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : RpcCache" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Contacts/Gmail'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Adresses e-mails des services et personnes qui nous ont contactés" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("Les contacts ne seront pas extraits")
        write-log -chemin $logs -message "Les contacts ne seront pas extraits"
    }

    if($global:cookies){
        #[System.Windows.MessageBox]::Show("Les cookies vont être extraits")
        write-log -chemin $logs -message "Les cookies vont être extraits"

        # Cookie LinkedIn
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.linkedin.android/app_webview/Default/Cookies"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.linkedin.android/app_webview/Default/Cookies' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.linkedin.android/app_webview/Default/Cookies'"
            .\adb shell mkdir -p $global:fullPath/"Cookies"/"LinkedIn"
            .\adb shell cp -r "/data/data/com.linkedin.android/app_webview/Default/Cookies" $global:fullPath/"Cookies"/"LinkedIn"

            ADD-content -path $fichier -value "- Cookies LinkedIn -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.linkedin.android/app_webview/Default/Cookies'" -Encoding utf8
            ADD-content -path $fichier -value "Table : cookies" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Cookies/LinkedIn'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Cookies et cookies de session" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        #Cookies Google Chrome
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.android.chrome/app_chrome/Default/Cookies"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.android.chrome/app_chrome/Default/Cookies' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.android.chrome/app_chrome/Default/Cookies'"
            .\adb shell mkdir -p $global:fullPath/"Cookies"/"Cookies_Google_Chrome"
            .\adb shell cp -r "/data/data/com.android.chrome/app_chrome/Default/Cookies" $global:fullPath/"Cookies"/"Cookies_Google_Chrome"

            ADD-content -path $fichier -value "- Cookies Google Chrome -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.android.chrome/app_chrome/Default/Cookies'" -Encoding utf8
            ADD-content -path $fichier -value "Table : cookies" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Cookies/Cookies_Google_Chrome'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Cookies de Google Chrome" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("Les cookies ne seront pas extraits")
        write-log -chemin $logs -message "Les cookies ne seront pas extraits"
    }

    if($global:deplacements){
        #[System.Windows.MessageBox]::Show("Les déplacement vont être extraits")
        write-log -chemin $logs -message "Les déplacement vont être extraits"

        #Samsung Health
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.sec.android.app.shealth/databases/sport.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.sec.android.app.shealth/databases/sport.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.sec.android.app.shealth/databases/sport.db'"
            .\adb shell mkdir -p $global:fullPath/"Deplacements"/"Samsung_Healt"
            .\adb shell cp -r "/data/data/com.sec.android.app.shealth/databases/sport.db" $global:fullPath/"Deplacements"/"Samsung_Healt"

            ADD-content -path $fichier -value "- Déplacements Samsung Health -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.sec.android.app.shealth/databases/sport.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : pace_element_info" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Deplacements/Samsung_Healt'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Informations sur les distances parcourues" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        #Pedometer
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.tayu.tau.pedometer/databases/DAY_WALK_COUNT"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.tayu.tau.pedometer/databases/DAY_WALK_COUNT' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.tayu.tau.pedometer/databases/DAY_WALK_COUNT'"
            .\adb shell mkdir -p $global:fullPath/"Deplacements"/"Pedometer"
            .\adb shell cp -r "/data/data/com.tayu.tau.pedometer/databases/DAY_WALK_COUNT" $global:fullPath/"Deplacements"/"Pedometer"

            ADD-content -path $fichier -value "- Déplacements Pedometer -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.tayu.tau.pedometer/databases/DAY_WALK_COUNT'" -Encoding utf8
            ADD-content -path $fichier -value "Table : DAY_WALK_COUNT" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Deplacements/Pedometer'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Date et heure du nombre de pas" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        #Google Maps
            #Domicile et travail
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.google.android.apps.maps/databases/gmm_myplaces.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.google.android.apps.maps/databases/gmm_myplaces.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.google.android.apps.maps/databases/gmm_myplaces.db'"
            .\adb shell mkdir -p $global:fullPath/"Deplacements"/"Domicile-Travail_Trajets_Google_Maps"
            .\adb shell cp -r "/data/data/com.google.android.apps.maps/databases/gmm_myplaces.db" $global:fullPath/"Deplacements"/"Domicile-Travail_Trajets_Google_Maps"

            ADD-content -path $fichier -value "- Déplacements Google Maps : domicile et travail -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.google.android.apps.maps/databases/gmm_myplaces.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : sync_item" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Deplacements/Domicile-Travail_Trajets_Google_Maps'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Adresses du domicile et du travail" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

            #Timeline
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.google.android.apps.maps/databases/gmm_storage.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.google.android.apps.maps/databases/gmm_storage.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.google.android.apps.maps/databases/gmm_storage.db'"
            .\adb shell mkdir -p $global:fullPath/"Deplacements"/"Trajets_Google_Maps"
            .\adb shell cp -r "/data/data/com.google.android.apps.maps/databases/gmm_storage.db" $global:fullPath/"Deplacements"/"Trajets_Google_Maps"

            ADD-content -path $fichier -value "- Déplacements Google Maps -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.google.android.apps.maps/databases/gmm_storage.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : gmm_storage_table" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Deplacements/Trajets_Google_Maps'" -Encoding utf8
            ADD-content -path $fichier -value "Description : DB permettant de construire l'historique des trajets" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

    } else {
        #[System.Windows.MessageBox]::Show("Les déplacements ne seront pas extraits")
        write-log -chemin $logs -message "Les déplacements ne seront pas extraits"
    }

    if($global:mails){
        #[System.Windows.MessageBox]::Show("Les mails vont être extrait")
        write-log -chemin $logs -message "Les mails vont être extrait"

    # Gmail
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.google.android.gm/databases/bigTopDataDB.-1661943233"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.google.android.gm/databases/bigTopDataDB.-1661943233' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.google.android.gm/databases/bigTopDataDB.-1661943233'"
            .\adb shell mkdir -p $global:fullPath/"E-mails"/"Apercu_des_mails_Gmail"
            .\adb shell cp -r "/data/data/com.google.android.gm/databases/bigTopDataDB.-1661943233" $global:fullPath/"E-mails"/"Apercu_des_mails_Gmail"

            ADD-content -path $fichier -value "- E-mail Gmail -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.google.android.gm/databases/bigTopDataDB.-1661943233'" -Encoding utf8
            ADD-content -path $fichier -value "Table : items | item_messages | item_message_attachments" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'E-mails/Apercu_des_mails_Gmail'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Aperçu des e-mails | E-mails compressés | Url des pièces jointes" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

    #Pièce jointes
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.google.android.gm/files/downloads/18d8dde7ac28c6bca539b052d91c41ee/attachments"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.google.android.gm/files/downloads/18d8dde7ac28c6bca539b052d91c41ee/attachments' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.google.android.gm/files/downloads/18d8dde7ac28c6bca539b052d91c41ee/attachments'"
            .\adb shell mkdir -p $global:fullPath/"E-mails"/"Pièces_jointes_Gmail"
            .\adb shell cp -r "/data/data/com.google.android.gm/files/downloads/18d8dde7ac28c6bca539b052d91c41ee/attachments" $global:fullPath/"E-mails"/"Pièces_jointes_Gmail"

            ADD-content -path $fichier -value "- Pièces jointes Gmail -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.google.android.gm/files/downloads/18d8dde7ac28c6bca539b052d91c41ee/attachments'" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'E-mails/Pièces_jointes_Gmail'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Pièces jointes téléchargées localement" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

    } else {
        #[System.Windows.MessageBox]::Show("Les mails ne seront pas extrait")
        write-log -chemin $logs -message "Les mails ne seront pas extrait"
    }

    if($global:actualite){
        #[System.Windows.MessageBox]::Show("Les différents fils d'actualités vont être extraits")
        write-log -chemin $logs -message "Les différents fils d'actualités vont être extraits"

#Fil d'actualité Instagram
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.instagram.android/databases/feed_items_room_db_866899647"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.instagram.android/databases/feed_items_room_db_866899647' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.instagram.android/databases/feed_items_room_db_866899647'"
            .\adb shell mkdir -p $global:fullPath/"File_d_actualite"/"Instagram"
            .\adb shell cp -r "/data/data/com.instagram.android/databases/feed_items_room_db_866899647" $global:fullPath/"File_d_actualite"/"Instagram"

            ADD-content -path $fichier -value "- Fil d'actualité Instagram -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.instagram.android/databases/feed_items_room_db_866899647'" -Encoding utf8
            ADD-content -path $fichier -value "Table : user_feed_items" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'File_d_actualite/Instagram'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Dernier contenu chargé dans l’affichage principale de Instagram" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("Les différents fils d'actualités ne seront pas extraits")
        write-log -chemin $logs -message "Les différents fils d'actualités ne seront pas extraits"
    }

    if($global:historique){
        #[System.Windows.MessageBox]::Show("L'historique internet va être extrait")
        write-log -chemin $logs -message "L'historique internet va être extrait"

        #Historique de navigation Google Chrome

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.android.chrome/app_chrome/Default/History"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.android.chrome/app_chrome/Default/History' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.android.chrome/app_chrome/Default/History'"
            .\adb shell mkdir -p $global:fullPath/"Historique_Internet"/"Historique-téléchargements_Google_Chrome"
            .\adb shell cp -r "/data/data/com.android.chrome/app_chrome/Default/History" $global:fullPath/"Historique_Internet"/"Historique-téléchargements_Google_Chrome"

            ADD-content -path $fichier -value "- Historique Google Chrome -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.android.chrome/app_chrome/Default/History'" -Encoding utf8
            ADD-content -path $fichier -value "Table : urls | downloads | downloads_url_chains | keyword_search_items" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Historique_Internet/Historique-téléchargements_Google_Chrome'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Historique Google Chrome | Liste des téléchargements | Urls des téléchargements | Mots tapés lors des recherches" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        # Google Chrome page hors connexion

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.android.chrome/app_chrome/Default/'Offline Pages'/metadata/OfflinePages.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.android.chrome/app_chrome/Default/'Offline Pages'/metadata/OfflinePages.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.android.chrome/app_chrome/Default/'Offline Pages'/metadata/OfflinePages.db'"
            .\adb shell mkdir -p $global:fullPath/"Historique_Internet"/"Pages_hors_connexion_Google_Chrome"
            .\adb shell cp -r "/data/data/com.android.chrome/app_chrome/Default/'Offline Pages'/metadata/OfflinePages.db" $global:fullPath/"Historique_Internet"/"Pages_hors_connexion_Google_Chrome"

            ADD-content -path $fichier -value "- Pages Google Chrome disponibles hors connexion -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.android.chrome/app_chrome/Default/'Offline Pages'/metadata/OfflinePages.db'" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Historique_Internet/Pages_hors_connexion_Google_Chrome'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Pages hors connexion" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        #Remplissage automatique des champs sur Google Chrome

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.android.chrome/app_chrome/Default/'Web Data'"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.android.chrome/app_chrome/Default/Web Data' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.android.chrome/app_chrome/Default/Web Data'"
            .\adb shell mkdir -p $global:fullPath/"Historique_Internet"/"Remplissage_automatique_des_champs"
            .\adb shell cp -r "/data/data/com.android.chrome/app_chrome/Default/'Web Data'" $global:fullPath/"Historique_Internet"/"Remplissage_automatique_des_champs"

            ADD-content -path $fichier -value "- Remplissage automatique des champs -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.android.chrome/app_chrome/Default/Web Data''" -Encoding utf8
            ADD-content -path $fichier -value "Table : autofil" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Historique_Internet/Remplissage_automatique_des_champs'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Remplissage automatique des champs Google Chrome" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

    } else {
        #[System.Windows.MessageBox]::Show("L'historique internet ne va pas être extrait")
        write-log -chemin $logs -message "L'historique internet ne va pas être extrait"
    }

#Droite

    if($global:ID){
        #[System.Windows.MessageBox]::Show("Les identifiants de connexion vont être extraits")
        write-log -chemin $logs -message "Les identifiants de connexion vont être extraits"

        # Comptes et mots de passe Google Chrome
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.android.chrome/app_chrome/Default/'Login Data'"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.android.chrome/app_chrome/Default/Login Data' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.android.chrome/app_chrome/Default/Login Data'"
            .\adb shell mkdir -p $global:fullPath/"Identifiant_de_connexion"/"Identifiant_de_connexion_Google_Chrome"
            .\adb shell cp -r "/data/data/com.android.chrome/app_chrome/Default/'Login Data'" $global:fullPath/"Identifiant_de_connexion"/"Identifiant_de_connexion_Google_Chrome"

            ADD-content -path $fichier -value "- Comptes et mots de passe Google Chrome -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.android.chrome/app_chrome/Default/Login Data'" -Encoding utf8
            ADD-content -path $fichier -value "Table : logins" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Identifiant_de_connexion/Identifiant_de_connexion_Google_Chrome'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Comptes et mots de passe" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("Les identifiants de connexion ne seront pas extraits")
        write-log -chemin $logs -message "Les identifiants de connexion ne seront pas extraits"
    }

    if($global:icc){
        #[System.Windows.MessageBox]::Show("L'identifiant ICC va être extrait")
        write-log -chemin $logs -message "L'identifiant ICC va être extrait"

        # ICC
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/user_de/0/com.android.providers.telephony/databases/telephony.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/user_de/0/com.android.providers.telephony/databases/telephony.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/user_de/0/com.android.providers.telephony/databases/telephony.db'"
            .\adb shell mkdir -p $global:fullPath/"ICC"
            .\adb shell cp -r "/data/user_de/0/com.android.providers.telephony/databases/telephony.db" $global:fullPath/"ICC"

            ADD-content -path $fichier -value "- Identifiant ICC -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/user_de/0/com.android.providers.telephony/databases/telephony.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : siminfo" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'ICC'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : International Circuit Card (ICC)" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("L'identifiant ICC ne va pas être extrait")
        write-log -chemin $logs -message "L'identifiant ICC ne va pas être extrait"
    }

    if($global:logs){
        #[System.Windows.MessageBox]::Show("Les journaux d'évènements (logs) vont être extraits")
        write-log -chemin $logs -message "Les journaux d'évènements (logs) vont être extraits"

        # Google Chrome
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.android.chrome/app_chrome/Default/'Local Storage'/leveldb/000003.log"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.android.chrome/app_chrome/Default/Local Storage/leveldb/000003.log' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.android.chrome/app_chrome/Default/Local Storage/leveldb/000003.log'"
            .\adb shell mkdir -p $global:fullPath/"Logs"/"Google_Chrome"
            .\adb shell cp -r "/data/data/com.android.chrome/app_chrome/Default/'Local Storage'/leveldb/000003.log" $global:fullPath/"Logs"/"Google_Chrome"

            ADD-content -path $fichier -value "- journaux d'évènements (logs) -" -Encoding utf8
            ADD-content -path $fichier -value " Logs de Google Chrome" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.android.chrome/app_chrome/Default/'Local Storage'/leveldb/000003.log'" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Logs/Google_Chrome'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Logs de Google Chrome" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        # Logs Facebook
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.facebook.katana/databases/IdleProfiler.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.facebook.katana/databases/IdleProfiler.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.facebook.katana/databases/IdleProfiler.db'"
            .\adb shell mkdir -p $global:fullPath/"Logs"/"Facebook"
            .\adb shell cp -r "/data/data/com.facebook.katana/databases/IdleProfiler.db" $global:fullPath/"Logs"/"Facebook"

            ADD-content -path $fichier -value " Logs de Facebook" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.facebook.katana/databases/IdleProfiler.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : IDLE_PROFILER_LOGS" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Logs/Facebook'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Date et heure de connexion sur l'appareil" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("Les journaux d'évènements (logs) ne seront pas extraits")
        write-log -chemin $logs -message "Les journaux d'évènements (logs) ne seront pas extraits"
    }

    if($global:appslist){
        #[System.Windows.MessageBox]::Show("La liste des applications va être extraite")
        write-log -chemin $logs -message "La liste des applications va être extraite"

        # Applications que Facebook détecte

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.facebook.katana/files/federated_learning/1120352237/papaya_store_1120352237/default.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.facebook.katana/files/federated_learning/1120352237/papaya_store_1120352237/default.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.facebook.katana/files/federated_learning/1120352237/papaya_store_1120352237/default.db'"
            .\adb shell mkdir -p $global:fullPath/"Liste_des_applications"/"Facebook"
            .\adb shell cp -r "/data/data/com.facebook.katana/files/federated_learning/1120352237/papaya_store_1120352237/default.db" $global:fullPath/"Liste_des_applications"/"Facebook"

            ADD-content -path $fichier -value "- Liste des applications -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.facebook.katana/files/federated_learning/1120352237/papaya_store_1120352237/default.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : record_data" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Liste_des_applications/Facebook'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Liste des applications présentes sur le smartphone recensé par Facebook" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("La liste des applications ne sera pas extraite")
        write-log -chemin $logs -message "La liste des applications ne sera pas extraite"
    }

    if($global:media){
        #[System.Windows.MessageBox]::Show("Les médias vont être extraits")
        write-log -chemin $logs -message "Les médias vont être extraits"

        # Photos et vidéos

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/sdcard/DCIM/Camera"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/sdcard/DCIM/Camera' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/sdcard/DCIM/Camera'"
            .\adb shell mkdir -p $global:fullPath/"Médias"/"Photos-vidéos"
            .\adb shell cp -r "/sdcard/DCIM/Camera" $global:fullPath/"Médias"/"Photos-vidéos"

            ADD-content -path $fichier -value "- Les médias -" -Encoding utf8
            ADD-content -path $fichier -value " Photos/vidéos" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/sdcard/DCIM/Camera'" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Médias/Photos-vidéos'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Images et vidéos prises avec la caméra du smartphone" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        # Medias Facebook

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/sdcard/DCIM/Facebook"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/sdcard/DCIM/Facebook' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/sdcard/DCIM/Facebook'"
            .\adb shell mkdir -p $global:fullPath/"Médias"/"Facebook"
            .\adb shell cp -r "/sdcard/DCIM/Facebook" $global:fullPath/"Médias"/"Facebook"

            ADD-content -path $fichier -value " Médias Facebook" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/sdcard/DCIM/Facebook'" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Médias/Facebook'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Photos enregistrées provenant de Facebook" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        # Média : capture d'écran
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/sdcard/Pictures/Screenshots"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/sdcard/Pictures/Screenshots' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/sdcard/Pictures/Screenshots'"
            .\adb shell mkdir -p $global:fullPath/"Médias"/"Capture_d-écran"
            .\adb shell cp -r "/sdcard/Pictures/Screenshots" $global:fullPath/"Médias"/"Capture_d-écran"

            ADD-content -path $fichier -value " Capture d'écran" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/sdcard/Pictures/Screenshots'" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Médias/Capture_d-écran'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Capture d'écran" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        # Medias Messenger

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/sdcard/Pictures/Messenger"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/sdcard/Pictures/Messenger' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/sdcard/Pictures/Messenger'"
            .\adb shell mkdir -p $global:fullPath/"Médias"/"Messenger"
            .\adb shell cp -r "/sdcard/Pictures/Messenger" $global:fullPath/"Médias"/"Messenger"

            ADD-content -path $fichier -value " Messenger" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/sdcard/Pictures/Messenger'" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Médias/Messenger'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Images enregistrées provenant de Messenger" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        #WhatsApp
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/sdcard/WhatsApp/Media"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/sdcard/WhatsApp/Media' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/sdcard/WhatsApp/Media'"
            .\adb shell mkdir -p $global:fullPath/"Médias"/"WhatsApp"
            .\adb shell cp -r "/sdcard/WhatsApp/Media" $global:fullPath/"Médias"/"WhatsApp"

            ADD-content -path $fichier -value " WhatsApp" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/sdcard/WhatsApp/Media'" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Médias/WhatsApp'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Médias WhatsApp" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        # Avatar compte Goolge
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.android.chrome/app_chrome/Default/Accounts/'Avatar Images'"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.android.chrome/app_chrome/Default/Accounts/Avatar Images' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.android.chrome/app_chrome/Default/Accounts/Avatar Images'"
            .\adb shell mkdir -p $global:fullPath/"Médias"/"Avatar_Google_Chrome"
            .\adb shell cp -r "/data/data/com.android.chrome/app_chrome/Default/Accounts/'Avatar Images'" $global:fullPath/"Médias"/"Avatar_Google_Chrome"

            ADD-content -path $fichier -value " Avatar du compte Google" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.android.chrome/app_chrome/Default/Accounts/Avatar Images'" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Médias/Avatar_Google_Chrome'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Avatar du compte Google" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("Les médias ne seront pas extraits")
        write-log -chemin $logs -message "Les médias ne seront pas extraits"
    }

    if($global:messages){
        #[System.Windows.MessageBox]::Show("Les messages vont être extraits")
        write-log -chemin $logs -message "Les messages vont être extraits"

        # Messages WhatsApp

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.whatsapp/databases/msgstore.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.whatsapp/databases/msgstore.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.whatsapp/databases/msgstore.db'"
            .\adb shell mkdir -p $global:fullPath/"Messages"/"WhatsApp"
            .\adb shell cp -r "/data/data/com.whatsapp/databases/msgstore.db" $global:fullPath/"Messages"/"WhatsApp"

            ADD-content -path $fichier -value "- Messages -" -Encoding utf8
            ADD-content -path $fichier -value " WhatsApp" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.whatsapp/databases/msgstore.db'" -Encoding utf8
            ADD-content -path $fichier -value "Tables : message | message_ftsv2 | jid" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Messages/WhatsApp'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Messages de WhatsApp | Messages de WhatsApp (uniquement le contenu) | Numéro de téléphone des contacts" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        #Messages Tinder

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.tinder/databases/tinder-3.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.tinder/databases/tinder-3.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.tinder/databases/tinder-3.db'"
            .\adb shell mkdir -p $global:fullPath/"Messages"/"Tinder"
            .\adb shell cp -r "/data/data/com.tinder/databases/tinder-3.db" $global:fullPath/"Messages"/"Tinder"

            ADD-content -path $fichier -value " Tinder" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.tinder/databases/tinder-3.db'" -Encoding utf8
            ADD-content -path $fichier -value "Tables : message | match_person | profile_user" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Messages/Tinder'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Messages échangés entre les différents matchs | Liste des différents matchs avec leur date de naissance, biographie et photo(s) | Données sur le possesseur du compte Tinder : Nom, date de naissance, …" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        # SMS
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.android.providers.telephony/databases/mmssms.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.android.providers.telephony/databases/mmssms.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.android.providers.telephony/databases/mmssms.db'"
            .\adb shell mkdir -p $global:fullPath/"Messages"/"SMS"
            .\adb shell cp -r "/data/data/com.android.providers.telephony/databases/mmssms.db" $global:fullPath/"Messages"/"SMS"

            ADD-content -path $fichier -value " SMS" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.android.providers.telephony/databases/mmssms.db'" -Encoding utf8
            ADD-content -path $fichier -value "Tables : sms | words_content" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Messages/SMS'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Numéros de téléphone du posesseur, SMS et centre de service, (…) | Uniquement le texte des SMS" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        #Messages Messenger

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.facebook.orca/databases/threads_db2"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.facebook.orca/databases/threads_db2' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.facebook.orca/databases/threads_db2'"
            .\adb shell mkdir -p $global:fullPath/"Messages"/"Messenger"
            .\adb shell cp -r "/data/data/com.facebook.orca/databases/threads_db2" $global:fullPath/"Messages"/"Messenger"

            ADD-content -path $fichier -value " Messenger" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.facebook.orca/databases/threads_db2'" -Encoding utf8
            ADD-content -path $fichier -value "Tables : messages | thread_users | threads" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Messages/Messenger'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Les messages envoyés et reçus les plus récents sur Messenger | Contacts récemment contactés ou consultés | Informations sur les groupes de messagerie" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        #Messages Instagram

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.instagram.android/databases/direct.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.instagram.android/databases/direct.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.instagram.android/databases/direct.db'"
            .\adb shell mkdir -p $global:fullPath/"Messages"/"Instagram"
            .\adb shell cp -r "/data/data/com.instagram.android/databases/direct.db" $global:fullPath/"Messages"/"Instagram"

            ADD-content -path $fichier -value " Instagram" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.instagram.android/databases/direct.db'" -Encoding utf8
            ADD-content -path $fichier -value "Tables : messages | sqlite_sequence | threads" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Messages/Instagram" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Tous les messages envoyés et reçus | Le nombre de messages | Correspondance avec les messages, on y trouve par exmemple l'username" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        # Message LinkedIn
        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.linkedin.android/databases/linkedin_messenger.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.linkedin.android/databases/linkedin_messenger.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.linkedin.android/databases/linkedin_messenger.db'"
            .\adb shell mkdir -p $global:fullPath/"Messages"/"LinkedIn"
            .\adb shell cp -r "/data/data/com.linkedin.android/databases/linkedin_messenger.db" $global:fullPath/"Messages"/"LinkedIn"

            ADD-content -path $fichier -value " LinkedIn" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.linkedin.android/databases/linkedin_messenger.db'" -Encoding utf8
            ADD-content -path $fichier -value "Tables : actors | actors_for_conversations_view | events | events_view" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Messages/LinkedIn'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Personnes contactées | Personnes contactées | Tous les messages envoyés et reçus | Tous les messages envoyés et reçus + Nom et prénom" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

    } else {
        #[System.Windows.MessageBox]::Show("Les messages ne seront pas extraits")
        write-log -chemin $logs -message "Les messages ne seront pas extraits"
    }

    if($global:notes){
        #[System.Windows.MessageBox]::Show("Les notes vont être extraites")
        write-log -chemin $logs -message "Les notes vont être extraites"

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.google.android.keep/databases/keep.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.google.android.keep/databases/keep.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.google.android.keep/databases/keep.db'"
            .\adb shell mkdir -p $global:fullPath/"Notes"/"Google_Keep"
            .\adb shell cp -r "/data/data/com.google.android.keep/databases/keep.db" $global:fullPath/"Notes"/"Google_Keep"

            ADD-content -path $fichier -value "- Notes : Google Keep -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.google.android.keep/databases/keep.db'" -Encoding utf8
            ADD-content -path $fichier -value "Tables : account | tree_entity | text_search_tree_entries | text_search_tree_entries_content" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Notes/Google_Keep'" -Encoding utf8
            ADD-content -path $fichier -value "Descriptions : Compte connecté | En-tête de la note | Note | Note" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("Les notes ne seront pas extraites")
        write-log -chemin $logs -message "Les notes ne seront pas extraites"
    }

    if($global:periodesdactivite){
        #[System.Windows.MessageBox]::Show("Les différentes périodes d'activitées vont être extraites")
        write-log -chemin $logs -message "Les différentes périodes d'activitées vont être extraites"

        # Périodes d'activités Samsung Health

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.sec.android.app.shealth/databases/SleepDetection.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.sec.android.app.shealth/databases/SleepDetection.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.sec.android.app.shealth/databases/SleepDetection.db'"
            .\adb shell mkdir -p $global:fullPath/"Périodes_d-activité"/"Samsung_Health"
            .\adb shell cp -r "/data/data/com.sec.android.app.shealth/databases/SleepDetection.db" $global:fullPath/"Périodes_d-activité"/"Samsung_Health"

            ADD-content -path $fichier -value "- Périodes d'activitée -" -Encoding utf8
            ADD-content -path $fichier -value " Samsung_Healt" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.sec.android.app.shealth/databases/SleepDetection.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : screen_data" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Périodes_d-activité/Samsung_Health'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Cette base de données calcul les périodes d'inactivité afin de fournir à l'utilisateur un graphique de leur heure de sommeil" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        # Période d'activité Facebook

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.facebook.katana/databases/time_in_app_1120352237.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.facebook.katana/databases/time_in_app_1120352237.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.facebook.katana/databases/time_in_app_1120352237.db'"
            .\adb shell mkdir -p $global:fullPath/"Périodes_d-activité"/"Facebook"
            .\adb shell cp -r "/data/data/com.facebook.katana/databases/time_in_app_1120352237.db" $global:fullPath/"Périodes_d-activité"/"Facebook"

            ADD-content -path $fichier -value " Facebook" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.facebook.katana/databases/time_in_app_1120352237.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : intervals" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Périodes_d-activité/Facebook'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Temps passé sur l'application Facebook" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }

        # Période d'activité Instagram

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.instagram.android/databases/time_in_app_866899647.db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.instagram.android/databases/time_in_app_866899647.db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.instagram.android/databases/time_in_app_866899647.db'"
            .\adb shell mkdir -p $global:fullPath/"Périodes_d-activité"/"Instagram"
            .\adb shell cp -r "/data/data/com.instagram.android/databases/time_in_app_866899647.db" $global:fullPath/"Périodes_d-activité"/"Instagram"

            ADD-content -path $fichier -value " Instagram" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.instagram.android/databases/time_in_app_866899647.db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : intervals" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Périodes_d-activité/Instagram'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Temps passé sur l’application Instagram" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("Les différentes périodes d'activitées ne seront pas extraites")
        write-log -chemin $logs -message "Les différentes périodes d'activitées ne seront pas extraites"
    }

    if($global:recherches){
        #[System.Windows.MessageBox]::Show("Les différentes recherches effectuées vont être extraites")
        write-log -chemin $logs -message "Les différentes recherches effectuées vont être extraites"

        # Recherches sur Messenger

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/data/data/com.facebook.orca/databases/search_cache_db"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/data/data/com.facebook.orca/databases/search_cache_db' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/data/data/com.facebook.orca/databases/search_cache_db'"
            .\adb shell mkdir -p $global:fullPath/"Recherches"/"Messenger"
            .\adb shell cp -r "/data/data/com.facebook.orca/databases/search_cache_db" $global:fullPath/"Recherches"/"Messenger"

            ADD-content -path $fichier -value "- Recherches avec l'application Messenger -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/data/data/com.facebook.orca/databases/search_cache_db'" -Encoding utf8
            ADD-content -path $fichier -value "Table : search_items" -Encoding utf8
            ADD-content -path $fichier -value "Destination : 'Recherches/Messenger'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Nous montre tout ce qu’on a recherché récemment" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("Les différentes recherches effectuées ne seront pas extraites")
        write-log -chemin $logs -message "Les différentes recherches effectuées ne seront pas extraites"
    }

    if($global:telechargements){
        #[System.Windows.MessageBox]::Show("Les téléchargements vont être extrait")
        write-log -chemin $logs -message "Les téléchargements vont être extrait"

        # On vérifie l'existance du fichier. Si erreur on ne le déplace pas.
        .\adb shell ls "/sdcard/Download"
        if($LASTEXITCODE -ne 0){
            write-log -chemin $logs -message "Erreur d'extraction : le fichier '/sdcard/Download' n'existe pas"

            # On réintialise les erreurs
            $LASTEXITCODE = 0
        } else {
            write-log -chemin $logs -message "Extraction du fichier '/sdcard/Download'"
            .\adb shell mkdir -p $global:fullPath/"Téléchargements"
            .\adb shell cp -r "/sdcard/Download" $global:fullPath/"Téléchargements"

            ADD-content -path $fichier -value "- Téléchargements -" -Encoding utf8
            ADD-content -path $fichier -value "Emplacement sur le smartphone : '/sdcard/Download'" -Encoding utf8
            ADD-content -path $fichier -value "Destination : '/Téléchargements'" -Encoding utf8
            ADD-content -path $fichier -value "Description : Dossier 'téléchargements' du téléphone" -Encoding utf8
            ADD-content -path $fichier -value " " -Encoding utf8
        }
    } else {
        #[System.Windows.MessageBox]::Show("Les téléchargements ne seront pas extrait")
        write-log -chemin $logs -message "Les téléchargements ne seront pas extrait"
    }

Start-Sleep -Seconds 10
.\adb pull $global:fullPath $global:folder
Start-Sleep -Seconds 20
.\adb shell rm -rf $global:fullPath

[System.Windows.MessageBox]::Show('Extraction réussie','Réussite','ok','Information')
write-log -chemin $logs -message "Extraction réussie"

$global:extait1fois = $true #empèche la fonction 'extraire une fois' d'etre à nouveau lancée --> eviter un éventuelle bug


#Renommage du rapport
[string]$date = Get-Date -Format "dd-MM-yyyy-HH-mm"
[string]$name = "Données_VERACITYZ"
[string]$file1 = "$date"+"_"+"$name"

Rename-Item $global:folder\"dataExtractor_tmp" -NewName $file1


Invoke-Item $global:folder


# Réintialisation des cases
    $Window.FindName("about_owner").IsChecked = $false
    $Window.FindName("agenda").IsChecked = $false
    $Window.FindName("appels").IsChecked = $false
    $Window.FindName("capteurs").IsChecked = $false
    $Window.FindName("contacts").IsChecked = $false
    $Window.FindName("cookies").IsChecked = $false
    $Window.FindName("deplacements").IsChecked = $false
    $Window.FindName("mails").IsChecked = $false
    $Window.FindName("actualite").IsChecked = $false
    $Window.FindName("historique").IsChecked = $false

    $Window.FindName("ID").IsChecked = $false
    $Window.FindName("icc").IsChecked = $false
    $Window.FindName("logs").IsChecked = $false
    $Window.FindName("appslist").IsChecked = $false
    $Window.FindName("media").IsChecked = $false
    $Window.FindName("messages").IsChecked = $false
    $Window.FindName("notes").IsChecked = $false
    $Window.FindName("periodesdactivite").IsChecked = $false
    $Window.FindName("recherches").IsChecked = $false
    $Window.FindName("telechargements").IsChecked = $false

    write-log -chemin $logs -message "Réintialisation des cases"


write-log -chemin $logs -message "Retour au menu"
hide_load
afficher_menu
})

$Window.FindName("exit_window_categorie").add_click({
    masquer_extraire_par_categorie
    afficher_menu
})

$Window.FindName("Bouton_cancel").add_click({
    masquer_extraire_par_categorie
    afficher_menu
})


# --- EXTRACT ONLY ONE ---
masquer_extract_one
masquer_parcourir_fichier

# Exit parcourir fichier smartphone
$Window.FindName("exit_window2").add_click({
    masquer_parcourir_fichier
    afficher_menu
})

# Exit fenêtre 1 extract one
$Window.FindName("exit_window").add_click({
    masquer_extract_one
    afficher_menu
})

$Window.FindName("extract").add_click({

    if($global:extait1fois)
    {
        [System.Windows.MessageBox]::Show('Vous devez relancer le programme pour extraire à nouveau un seul élement','Information','ok','Information')
        write-log -chemin $logs -message "Information : seulement un seul fichier ou dossier peut être extrait avec la fonction 'Extraire un seul fichier ou dossier'"
    } else {
        extract_only_one
    }
})

# - SELECT PATH -
$Window.FindName("Bouton_Parcourir").add_click({
    select_file
})

# --- OPEN DB ---
$Window.FindName("open_db").add_click({
    
    write-log -chemin $logs -message "Ouverture de fichier"

    $db = $null
    #Va aller chercher le programme SQLite dans le dossier du programme
    $software = "$PSScriptRoot\Resource\DB Browser for SQLite\DB Browser for SQLite.exe"
    Add-Type -AssemblyName System.Windows.Forms #afin de savoir le lancer sans ps ISE
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('CommonDocuments') }
    #Afficher la fenêtre de selection
    $null = $FileBrowser.ShowDialog()
    #Récupérer le nom du fichier
    $db = $FileBrowser.filename
    $db_long_path = """$db""" #Pour prendre en compte les espaces
    #Lancement du programme avec le fichier

    #Test si un fichier a été selectionné
    if($db){
    [System.Windows.MessageBox]::Show("Le fichier sélectionné est : $db")
        try {
        write-log -chemin $logs -message "Ouverture du fichier : $db"
        Invoke-Item $db
        }
        catch {
        write-log -chemin $logs -message "Ouverture de la base de données : $db"
        Start-Process $software $db_long_path
        }
    }
})

# --- FAST ROOT ---
$Window.FindName("fast_root").add_click({

     $msgBoxInputAskFastRootMenu = [System.Windows.MessageBox]::Show('Etes-vous sûr de vouloir effectuer un root rapide ?','Confirmation','YesNo','Question')

     switch  ($msgBoxInputAskFastRootMenu)
        {
        'Yes'
            {
            fast_root
            }
        }
})

# --- BARRE DE CHARGEMENT --
hide_load

# -- OPEN SHELL --
$Window.FindName("open_shell").add_click({
    open_shell
})

# --- ABOUT ---
#Menu about de base caché
$Window.FindName("barre_menu_about").Visibility = "Hidden"
$Window.FindName("bouton_about").Visibility = "Hidden"
$Window.FindName("Bouton_texte_about").Visibility = "Hidden"

$Window.FindName("about").add_click({

write-log -chemin $logs -message "Affichage de la fenêtre ''A propos de VERACITYZ''"
    # -- Ouvrir la fenêtre about --
    masquer_menu

#Afficher la fenêtre about
    $Window.FindName("barre_menu_about").Visibility = "Visible"
    $Window.FindName("bouton_about").Visibility = "Visible"
    $Window.FindName("Bouton_texte_about").Visibility = "Visible"

    # -- Fermer la fenêtre about --
    $Window.FindName("Bouton_texte_about").add_click({
    #Cacher la fenêtre about
        $Window.FindName("barre_menu_about").Visibility = "Hidden"
        $Window.FindName("bouton_about").Visibility = "Hidden"
        $Window.FindName("Bouton_texte_about").Visibility = "Hidden" 
        afficher_menu
    })
})

#Menu aide de base caché
$Window.FindName("barre_menu_aide1").Visibility = "Hidden"
$Window.FindName("aide").Visibility = "Hidden"
$Window.FindName("Bouton_texte").Visibility = "Hidden"

# --- HELP ---
$Window.FindName("help").add_click({

write-log -chemin $logs -message "Affichage de la fenêtre d'aide"
    # -- Ouvrir la fenêtre aide --
    masquer_menu

#Afficher la fenêtre aide
    $Window.FindName("barre_menu_aide1").Visibility = "Visible"
    $Window.FindName("aide").Visibility = "Visible"
    $Window.FindName("Bouton_texte").Visibility = "Visible"

    # -- Fermer la fenêtre aide --
    $Window.FindName("Bouton_texte").add_click({
    #Cacher la fenêtre aide
        $Window.FindName("barre_menu_aide1").Visibility = "Hidden"
        $Window.FindName("aide").Visibility = "Hidden"
        $Window.FindName("Bouton_texte").Visibility = "Hidden"
        afficher_menu
    })
})

# --- EXIT ---
$Window.FindName("Exit").add_click({
$msgBoxInputExit = [System.Windows.MessageBox]::Show('Voulez-vous fermer le programme ?','Fermeture','YesNoCancel','Question')

    switch($msgBoxInputExit)
    {
        'Yes'
        {
            $msgBoxInputAskReport = [System.Windows.MessageBox]::Show('Voulez-vous générer un rapport?','Confirmation','YesNo','Question')

                switch  ($msgBoxInputAskReport)
                {
                    'Yes'
                    {
                    generer_rapport
                    }
                }

            write-log -chemin $logs -message "Fermeture du programme"
            write-log -chemin $logs -message "_____________________________________________________"
            Remove-Item $fichier
            exit        
        }
    }
 })

function masquer_menu()
{
    $Window.FindName("menu").Visibility = "Hidden"
}
function afficher_menu()
{
    $Window.FindName("menu").Visibility = "Visible"
}

# parcourir un fichier
function browseFile($file)
{
    $Window.FindName("Bouton_texte_Suivant2").add_click({
        $global:file = $Window.FindName("barre_recherche").("Text")

        .\adb shell mkdir -p $global:fullPath
        .\adb shell cp -r $file $global:fullPath

# Si l'utilisateur ne rentre aucun nom de fichier et clique sur suivant, il y aura une erreur
# De même si le fichier n'existe pas

        if(($LASTEXITCODE -ne 0) -or ($file -eq "")){
            [System.Windows.MessageBox]::Show("Votre fichier n'existe pas",'File not found','ok','Error')
            write-log -chemin $logs -message "Erreur d'extraction : le fichier ''$file'' n'existe pas"
            $LASTEXITCODE = 0
        } else {

            write-log -chemin $logs -message "Exctraction d'un seul fichier : $file"

            ADD-content -path $fichier -value "Extraction d'un fichier au choix" -Encoding utf8
            ADD-content -path $fichier -value "Vous avez extrait le fichier $file dans le répertoire $global:folder" -Encoding utf8

            show_load
            masquer_parcourir_fichier

            if($global:extait1fois)
            {
                write-log -chemin $logs -message "Une erreur inconnue vient de se produire"
                [System.Windows.MessageBox]::Show('Erreur : Relancez le programme pour extraire un seul élement','Erreur','ok','Error')
                hide_load
                afficher_menu
                write-log -chemin $logs -message "Retour au menu"

            } else {
                [System.Windows.MessageBox]::Show("Début des opérations")
                Start-Sleep -Seconds 60
                applicaiton_des_parametres_extract_one
            }
        }
    })
}


$Window.FindName("Bouton_texte_Suivant").add_click({
    $global:folder = $Window.FindName("the_text").("Text")

# Si l'utilisateur ne rentre aucun nom de dossier dans la barre de recherche et clique sur suivant, il y aura une erreur.
# Le dossier sera alors "default_folder".
    if($global:folder -eq ""){
        [System.Windows.MessageBox]::Show('Le résultat sera placé dans le repertoire par défaut : default_folder','Information','ok','Information')
        $global:folder = "default_folder"
    } 
    [System.Windows.MessageBox]::Show("Le dossier est à présent : $global:folder")
    write-log -chemin $logs -message "Le dossier de destination est $global:folder"

    suite_execution_extract_one
})


function select_file($folder)
{
    write-log -chemin $logs -message "Selection d'un dossier de destination pour la fonction ''Extraire un seul fichier''"
    Add-Type -AssemblyName System.Windows.Forms
    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Sélectionnez un dossier"
    $foldername.SelectedPath = $mydocuments = [environment]::getfolderpath("mydocuments")

    if($foldername.ShowDialog() -eq "OK")
    {
        $global:folder = $foldername.SelectedPath
        [System.Windows.MessageBox]::Show("Le dossier est à présent : $global:folder")
        write-log -chemin $logs -message "Le dossier de destination est $global:folder"
        suite_execution_extract_one
    }
}

function fast_root()
{
    write-log -chemin $logs -message "- Routage rapide -"
    [System.Windows.MessageBox]::Show('Rootage rapide')
    [System.Windows.MessageBox]::Show("Veuillez allumer votre Smartphone.`nAppuyez ensuite sur 'OK")

    #afficher_chargement
    show_load
    masquer_menu
    [System.Windows.MessageBox]::Show("Connectez le Smartphone en USB.`nAppuyez ensuite sur 'OK'")

    cd $software_folder
    .\adb reboot bootloader

    if($LASTEXITCODE -eq 0)
    {
        $ErrorActionPreference = 'SilentlyContinue' # Pour éviter de générer une erreur alors qu'il n'y en a pas
        Start-Sleep -Seconds 10
        .\fastboot boot recovery.img
        Start-Sleep -Seconds 40
        $ErrorActionPreference = 'Stop'

        write-log -chemin $logs -message "Ouverture automatique du shell du smartphone"
        start-process -FilePath $runCmd -Argument $variable -workingdirectory $software_folder
        [System.Windows.MessageBox]::Show('Opération réussie','Réussite','ok','Information')
        write-log -chemin $logs -message "Routage rapide réussi"
        
        hide_load
        afficher_menu
    } else {
        [System.Windows.MessageBox]::Show('Erreur, Smartphone non trouvé','Erreur','ok','Error')
        write-log -chemin $logs -message "Erreur : smartphone non trouvé"
        hide_load
        afficher_menu
    }
}

function open_shell()
{
    write-log -chemin $logs -message "Ouverture du shell du smartphone"
    cd $software_folder
    .\adb shell ls

    if($LASTEXITCODE -eq 0)
    {
        start-process -FilePath $runCmd -Argument $variable -workingdirectory $software_folder
        write-log -chemin $logs -message "Réussite de l'accès au shell du smartphone"
    } else {
        [System.Windows.MessageBox]::Show('Erreur, Smartphone non trouvé','Erreur','ok','Error')
        write-log -chemin $logs -message "Echec de l'accès au shell du smartphone"

        $msgBoxInputAskFastRoot = [System.Windows.MessageBox]::Show('Voulez-vous effectuer un root rapide ?','Root rapide ?','YesNo','Question')

        switch ($msgBoxInputAskFastRoot)
        {
            'Yes'
            {
            fast_root
            }
        }
    }
}

function applicaiton_des_parametres_extract_one()
{
    $software_folder = "$PSScriptRoot\Resource\platform-tools"
    New-Item -Path $global:folder -ItemType Directory -Force
    cd $software_folder
    #Start-Sleep -Seconds 120 # A décommenter si les extractions sont incomplètes
    .\adb pull $global:fullPath $global:folder
    Start-Sleep -Seconds 60
    .\adb shell rm -rf $global:fullPath

    [System.Windows.MessageBox]::Show('Extraction réussie','Réussite','ok','Information')
    write-log -chemin $logs -message "Extraction d'un seule fichier réussie"

    $global:extait1fois = $true
    Invoke-Item $global:folder

    hide_load
    afficher_menu
    write-log -chemin $logs -message "Retour au menu"
}

function suite_execution_extract_one($folder)
{
    masquer_extract_one
    afficher_parcourir_fichier
    browseFile
}

function extract_only_one($folder)
{
    write-log -chemin $logs -message "- Fonction d'extraction d'un seul fichier -"
#___ Vérifie la présence du smartphone
    cd $software_folder
    .\adb shell ls

    if($LASTEXITCODE -eq 0)
    {
        masquer_menu
        afficher_extract_one
        [System.Windows.MessageBox]::Show('Cette action va alterer la mémoire du smartphone.','Attention','OK','Warning')
    } else {
        write-log -chemin $logs -message "Erreur : smartphone non trouvé"
        [System.Windows.MessageBox]::Show('Erreur, Smartphone non trouvé','Erreur','ok','Error')
        $msgBoxInputAskFastRoot = [System.Windows.MessageBox]::Show('Voulez-vous effectuer un root rapide ?','Root rapide ?','YesNo','Question')

        switch ($msgBoxInputAskFastRoot)
        {
            'Yes'
            {
                fast_root
            }
        }
    }
}

#-- ici
$Window.FindName("rapport").add_click({
    generer_rapport
    hide_load
    afficher_menu
})
#--

function write-log ($message, $chemin)
{
    $DateAction = Get-Date -Format "dddd dd/MM/yyyy HH:mm"
    $messageComplet = $DateAction + " > " + $message
    $messagecomplet | Out-File -FilePath $chemin -Append
    Write-Host $messageComplet
}

#Création du fichier temporaire vide.

$fichier = "$PSScriptRoot\PDF\tmp.txt" # RAPPORT

# Supprime le fichier si le programme n'a pas été fermé correctement
$ErrorActionPreference = 'SilentlyContinue'
Remove-Item $fichier
$ErrorActionPreference = 'Stop'

New-Item -Path $fichier -ItemType File -ErrorAction SilentlyContinue
ADD-content -path $fichier -value "                                                                     --- RAPPORT D'EXTRACTION ---" -Encoding utf8
$DateAction = Get-Date -Format "dddd dd/MM/yyyy HH:mm"
ADD-content -path $fichier -value "Date du lancement de VERACITYZ $DateAction" -Encoding utf8


$logs = "$PSScriptRoot\PDF\logs.txt" # LOGS
New-Item -Path $logs -ItemType File -ErrorAction SilentlyContinue
write-log -chemin $logs -message "_____________________________________________________"
write-log -chemin $logs -message ""
write-log -chemin $logs -message "- Fichier de logs -"
write-log -chemin $logs -message ""


$Window.ShowDialog()

$FormXML = (New-Object System.Xml.XmlNodeReader $XML)
$Window = [Windows.Markup.XamlReader]::Load($FormXML)