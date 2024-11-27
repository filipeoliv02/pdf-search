
# pdfsearch

`pdfsearch` is a command-line utility that allows you to search for a specific string in PDF files within a directory. It supports recursive searching through subdirectories and provides an interactive menu to open matching PDFs.

---

## Features
- **Search PDFs:** Find all instances of a string in PDF files.
- **Recursive Search:** Optionally search within all subdirectories.
- **Interactive Menu:** Select and open matching PDFs using an interactive menu.
- **Custom Directory:** Specify a directory to search (default is the current directory).

---

## Installation

1. Copy the `pdfsearch` script to a directory in your `$PATH`, e.g., `/usr/local/bin/`.
2. Make the script executable:
   ```bash
   chmod +x /usr/local/bin/pdfsearch
   ```
3. Ensure dependencies are installed:
   - `pdfgrep` for searching inside PDF files.
   - `xdg-open` for opening PDF files (on Linux).

---

## Usage

### Basic Syntax
```bash
pdfsearch [options] [path] (stringToSearch)
```

### Options:
- `-h, --help`  
  Displays a help menu and exits.

- `-r, --recursive`  
  Search for PDF files within subdirectories.

### Arguments:
- `path`  
  The directory where the script will search for PDFs (default: current directory).

- `stringToSearch`  
  The string to search for in the PDF files.

---

## Examples

### Search in the Current Directory
```bash
pdfsearch "example text"
```

### Search in a Specific Directory
```bash
pdfsearch /path/to/directory "example text"
```

### Search Recursively in Subdirectories
```bash
pdfsearch -r /path/to/directory "example text"
```

### Show Help Menu
```bash
pdfsearch -h
```

---

## How It Works

1. **Argument Parsing:**  
   The script processes user input to determine the directory, string to search, and whether to search recursively.

2. **PDF Search:**  
   It uses `pdfgrep` to search for the string in PDF files. Results are formatted to display the file name and line number.

3. **Interactive Menu:**  
   If matches are found, the script displays an interactive menu where you can select and open a PDF using `xdg-open`.

---

## Dependencies

Ensure the following are installed:
- `bash` (default shell on most Unix-like systems).
- `pdfgrep` for searching within PDF files.
- `awk` for text processing.
- `xdg-open` to open PDF files (Linux).

---

## License
This project is released under the MIT License.

---

## Author
Developed by Filipe Teixeira. Contributions and suggestions are welcome!
