#!/usr/bin/env bash

# Make sure pwd is the directory of the script
cd "$(dirname "$0")"

# Function to restore the screen
restore_screen() {
    tput rmcup
    exit
}

# Intercept SIGINT (Ctrl+C) and call the restore_screen function
trap restore_screen SIGINT

# Save the current screen content and the cursor position
tput smcup

# Delete the screen
clear

# Define associative arrays for every language

# ENGLISH
declare -A messages_en=(
  [ANSWER_YES_OR_NO]="Please answer with 'yes' or 'no'."
  [CHECK_DEPENDENCIES]="This script will check whether the necessary dependencies are installed and offer options for installation if necessary."
  [CHOOSE_OPTION]="Please choose an option: "
  [CONFIRM_INSTALLATION]="Would you like to continue with the installation? (Yes No) "
  [DOWNLOAD_AND_EXIT_SCRIPT]="Download and exit script"
  [DOWNLOAD_AND_PREVIEW_SCRIPT]="Download script, review and decide"
  [DOWNLOADING_SCRIPT]="Downloading nvm install script..."
  [DOWNLOADING_INSTALL_SCRIPT]=""
  [INSTALLATION_ABORTED]="Installation aborted by user. Exiting..."
  [INSTALLING_NVM_NODE]="Installing nvm and Node.js..."
  [INVALID_OPTION]="Invalid option. Please try again."
  [NO_EXIT]="No/Exit"
  [NO]="No"
  [NPM_INSTALLED]="npm is available. Node modules are installed with npm."
  [NPM_NOT_INSTALLED]="npm ist not installed."
  [OPEN_FOR_REVIEW]="Opening the downloaded script for review. Please close the editor to proceed."
  [PNPM_INSTALLED]="pnpm is available. Node modules are installed with pnpm."
  [QUESTION_INSTALL_NVM_NODE]="Do you wish to proceed with the installation of nvm and Node.js?"
  [STARTING_SERVER]="Entering SillyTavern..."
  [WELCOME]="Welcome to the Sillytavern installation script!"
  [YARN_INSTALLED]="Yarn is available. Node modules are installed with Yarn."
  [YES_AUTO_INSTALL]="Yes, install automatically"
  [YES]="Yes"
)

# GERMAN/DEUTSCH
declare -A messages_de=(
  [ANSWER_YES_OR_NO]="Bitte antworte mit 'ja' oder 'nein'."
  [CHECK_DEPENDENCIES]="Dieses Skript wird prüfen, ob die notwendigen Abhängigkeiten installiert sind und Ihnen Optionen zur Installation bieten, falls notwendig."
  [CHOOSE_OPTION]="Bitte wähle eine Option: "
  [CONFIRM_INSTALLATION]="Möchtest du mit der Installation fortfahren? (ja/nein) "
  [DOWNLOAD_AND_EXIT_SCRIPT]="Skript herunterladen und beenden"
  [DOWNLOAD_AND_PREVIEW_SCRIPT]="Skript herunterladen, ansehen und entscheiden"
  [DOWNLOADING_SCRIPT]="Herunterladen des nvm-Installationsskripts..."
  [INSTALLATION_ABORTED]="Installation vom Benutzer abgebrochen. Beenden..."
  [INSTALLING_NVM_NODE]="Installation von nvm und Node.js..."
  [INVALID_OPTION]="Ungültige Option. Bitte versuche es erneut."
  [NO_EXIT]="Nein/Beenden"
  [NO]="Nein"
  [NPM_INSTALLED]="npm ist verfügbar. Node Modules werden mit npm installiert."
  [NPM_NOT_INSTALLED]="npm ist nicht installiert."
  [OPEN_FOR_REVIEW]="Öffnen des heruntergeladenen Skripts zur Durchsicht. Bitte schließen Sie den Editor, um fortzufahren."
  [PNPM_INSTALLED]="pnpm ist verfügbar. Node Modules werden mit pnpm installiert."
  [QUESTION_INSTALL_NVM_NODE]="Möchten Sie mit der Installation von nvm und Node.js fortfahren?"
  [STARTING_SERVER]="Starten des SillyTavern Servers..."
  [WELCOME]="Willkommen zum SillyTavern-Installationsskript!"
  [YARN_INSTALLED]="Yarn ist verfügbar. Node Modules werden mit Yarn installiert."
  [YES_AUTO_INSTALL]="Ja, automatisch installieren"
  [YES]="Ja"
)

# Reference variable for the messages
declare -n messages

# Function to load the messages based on the language selection
load_messages() {
  local lang=$1
  case $lang in
    en)
      messages=messages_en
      ;;
    de)
      messages=messages_de
      ;;
    *)
      echo "Unsupported language. Exiting..."
      exit 1
      ;;
  esac
}

# Fancy ASCII Art
echo "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⡿⠿⠿⠿⣿⠉⠉⣿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⣿⠉⠉⣿⠿⠿⠿⢿⣿
⣿⣧⣤⣤⣤⣿⠀⠀⣿⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣿⠀⠀⣿⣤⣤⣤⣼⣿
⣿⣿⣿⣿⣿⣿⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⠀⠛⠛⠛⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⠿⠿⠿⠀⣿⣿⣿⣿
⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢀⣤⠤⣴⠟⠻⠶⠶⣦⠀⠀⠀⠀⠀⣀⣀⣿⣿⣿⣿
⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢸⡇⠀⢀⠀⢀⣆⠀⣸⣤⣄⠀⠀⠀⠉⠙⣿⣿⣿⣿
⣿⣿⣿⣿⠿⠛⠒⠀⠀⠀⠀⣻⡟⠛⠷⠾⠛⢻⣟⠉⢿⡆⠀⠀⠀⠀⣿⣿⣿⣿
⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⣿⠀⢸⡇⠀⠀⠀⠀⣿⣿⣿⣿
⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⣿⠀⣿⠃⠀⠀⠶⣶⣿⣿⣿⣿
⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣯⣤⣤⣤⣤⣤⣤⣽⠟⠋⠀⠀⠀⠀⠈⣿⣿⣿⣿
⣿⣿⣿⣿⣤⣤⣄⡀⠀⠀⠀⣧⣤⣤⣤⣤⣤⣤⣼⠀⠀⠀⢀⣠⣤⣤⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀⣀⣀⣀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"

# Language selection
echo "Please select your language / Bitte wählen Sie Ihre Sprache:"
echo "1) English"
echo "2) Deutsch"
read -p "Selection / Auswahl (1/2): " lang_selection

# Use the messages for the selected language
case $lang_selection in
  1)
    load_messages "en"
    ;;
  2)
    load_messages "de"
    ;;
  *)
    echo "Invalid selection / Ungültige Auswahl. Exiting / Beenden."
    exit 1
    ;;
esac

# Use the messages from the array
echo "${messages[WELCOME]}"
echo "${messages[CHECK_DEPENDENCIES]}"
sleep 1
echo "debug 1"
sleep 1

# Function to install nvm and Node.js
install_nvm_node() {
  echo "${messages[INSTALLING_NVM_NODE]}"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install --lts
  nvm use --lts
}

# Function to download and preview the nvm install script
download_and_edit_nvm_script() {
  local script="nvm-install.sh"
  echo "${messages[DOWNLOADING_SCRIPT]}"
  curl -o "$script" https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh
  echo "${messages[OPEN_FOR_REVIEW]}"
  ${EDITOR:-nano} "$script"
  echo "${messages[QUESTION_INSTALL_NVM_NODE]}"
  select yn in "${messages[YES]}" "${messages[NO]}"; do
    case $yn in
      Yes ) install_nvm_node; break;;
      No ) echo "${messages[INSTALLATION_ABORTED]}"; exit;;
    esac
  done
}

# Function to confirm the installation
confirm_installation() {
  while true; do
    read -p "${messages[CONFIRM_INSTALLATION]}" yn
    case $yn in
      [Jj]* ) break;;
      [Nn]* ) echo "${messages[INSTALLATION_ABORTED]}"; exit;;
      * ) echo "${messages[ANSWER_YES_OR_NO]}";;
    esac
  done
}

# Main script
# Prefer pnpm over yarn to install Node.js
if command -v pnpm &> /dev/null; then
  echo "${messages[PNPM_INSTALLED]}"
  confirm_installation
  pnpm install
# Use yarn if pnpm is not installed
if command -v yarn &> /dev/null; then
  echo "${messages[YARN_INSTALLED]}"
  confirm_installation
  yarn install
# If npm is installed, use npm if yarn is not installed
elif command -v npm &> /dev/null; then
  echo "${messages[NPM_INSTALLED]}"
  confirm_installation
  npm install
# Else ask the user if they want to install NVM and Node.js
else
  echo "${messages[NPM_NOT_INSTALLED]}"
  PS3="${messages[CHOOSE_OPTION]}"
  options=("${messages[YES_AUTO_INSTALL]}" "${messages[DOWNLOAD_AND_PREVIEW_SCRIPT]}" "${messages[DOWNLOAD_AND_EXIT_SCRIPT]}" "${messages[NO_EXIT]}")
  select opt in "${options[@]}"
  do
    case $opt in
    # Install NVM and Node.js
      "${messages[YES_AUTO_INSTALL]}")
        install_nvm_node
        break
        ;;
    # Download and preview the nvm install script
      "${messages[DOWNLOAD_AND_PREVIEW_SCRIPT]}")
        download_and_edit_nvm_script
        break
        ;;
    # Download and exit the script
      "${messages[DOWNLOAD_AND_EXIT_SCRIPT]}")
        download_nvm_script
        echo "${messages[SCRIPT_DOWNLOADED_EXIT]}"
        exit
        ;;
    # Exit the script
      "${messages[NO_EXIT]}")
        echo "${messages[INSTALLATION_ABORTED]}"
        exit
        ;;
    # Invalid option
      *) echo "${messages[INVALID_OPTION]}";;
    esac
  done
fi

# Start the server
echo "${messages[STARTING_SERVER]}"
node "$(dirname "$0")/server.js"

# Restore the stored screen content and the cursor position
restore_screen
