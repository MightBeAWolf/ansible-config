# Function to print error messages with red text
print_error() {
  echo -e "\e[31mError: $1\e[0m"
}
