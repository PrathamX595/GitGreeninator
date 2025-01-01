# GitGreeninator

It's just a fun and simple script that can make your github graph green from the day you specify.

## Features

- Automatically configures your Git user name and email if not already set.
- Creates a new repository and makes a series of commits based on the number of days specified.
- Pushes the commits to a new private repository on GitHub.

## Prerequisites

- Git must be installed on your system.
- GitHub CLI (`gh`) must be installed. If not, the script will install it for you.(ofcourse you'll need to authenticate)

## Usage

1. Clone the repository or download the script.
2. Open a terminal and navigate to the directory containing the script.
3. Make the script executable:
    ```bash
    chmod +x gitgreeninator.sh
    ```
4. Run the script:
    ```bash
    ./gitgreeninator.sh
    ```

## How It Works

1. The script checks if your Git user name and email are configured. If not, it prompts you to enter them and sets them up.
2. It prompts you to enter the number of days for which you want to generate commits.
3. The script creates a new directory, initializes a Git repository, and makes a series of commits with dates going back the specified number of days.
4. It creates a new private repository on GitHub and pushes the commits to it.

## Example

```bash
./gitgreeninator.sh
```

Follow the prompts to enter your GitHub username, email, and the number of days for which you want to generate commits. The script will handle the rest.

⚠️ **Disclaimer**  
This script is intended for educational purposes only. Do not use it to deceive anyone for official purposes. Misuse of this script may violate GitHub's terms of service and could lead to account suspension or other consequences.
