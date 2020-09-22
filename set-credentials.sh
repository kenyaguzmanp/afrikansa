# Set credentials for user in git
# command: sh set-credentials.sh <gabi|kathe>

USER_NAMES_ARRAY=([1]="Gabriela Contreras" [2]="Katherine Contreras")
EMAIL_NAMES_ARRAY=([1]="gabrielac0901@gmail.com" [2]="kathijcs@gmail.com")

printf "\033[1;33mWelcome to your Lazy set credentials...\033[0m\n"

set_credentials()
{
    INDEX=$1
    USER_NAME="${USER_NAMES_ARRAY[$INDEX]}"
    USER_EMAIL="${EMAIL_NAMES_ARRAY[$INDEX]}"
    printf "You will set credentials for: \033[1;34m$USER_NAME\033[0m\n"
    printf "\033[1;31mDeleting current credentials...\033[0m\n"
    git credential-manager delete https://github.com/

    git config user.name $USER_NAME
    git config user.email $USER_EMAIL --replace-all
    printf "\033[1;92mSuccess. Your new credentials are: \033[0m\n"
    git config user.name && git config user.email
}

case $1 in
    "gabi")
        set_credentials "1"
        ;;
    "kathe")
        set_credentials "2"
        ;;
        *)
    Echo "Sorry, name not found"
    ;;
esac