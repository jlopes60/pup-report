# pup-report

## LaTeX2e template for FEUP's Project FE-UP

The published version lives in Overleaf.

Given the limitations on Overleaf's compilation time, it may be necessary to use the sources locally.

To do this, you need to:

1) have a local distribution to compile the sources (MiKTeX, TeX Live)

2) use a convenient editor (VSCode + LaTeX Workshop, TeXMaker, TeXstudio

---

## Compile LaTeX in **VSCode** on Linux or Windows.

### 1) Install the prerequisites

* Install a TeX distribution:

  * **Windows:** MiKTeX (easy) or TeX Live (complete)
  * **Linux:** TeX Live (`sudo apt install texlive-full` on Ubuntu/Debian)
* Install **VS Code**.
* Install the extension **LaTeX Workshop** (by James Yu).

> Tip: If you’ll use `minted` for code highlighting, also install Python and `pip install Pygments`.

### 2) Basic workflow (works out of the box)

1. Open your LaTeX folder in VS Code.
2. Open your **main** file (e.g., `main.tex`).
3. Press **Ctrl+Shift+P** → “**LaTeX Workshop: Build LaTeX project**”
   or click the **TeX** icon in the sidebar → **Build LaTeX project**.
4. The extension runs **latexmk** by default and shows the PDF in the built-in viewer.

If latexmk is missing, let MiKTeX install it on-the-fly or install the `latexmk` package in TeX Live.

### 3) Switching engines & backends (the easy way)

Add *magic comments* at the top of your `.tex` file:

```tex
% !TeX program = pdflatex     % or xelatex / lualatex
% !BIB program = biber        % or bibtex
% !TeX root = main.tex        % if this file isn't the root
```

LaTeX Workshop respects these and picks the right engine/backend.

### 4) Recipes you may want (optional settings)

The extension already has sane defaults. If you want explicit recipes (e.g., shell-escape), create or edit `.vscode/settings.json` in your project:

```json
{
  "latex-workshop.latex.tools": [
    { "name": "pdflatex", "command": "pdflatex", "args": ["-synctex=1","-interaction=nonstopmode","-file-line-error","%DOC%"] },
    { "name": "xelatex",  "command": "xelatex",  "args": ["-synctex=1","-interaction=nonstopmode","-file-line-error","%DOC%"] },
    { "name": "lualatex", "command": "lualatex", "args": ["-synctex=1","-interaction=nonstopmode","-file-line-error","%DOC%"] },
    { "name": "biber",    "command": "biber",    "args": ["%DOCFILE%"] },
    { "name": "pdflatex-shell", "command": "pdflatex", "args": ["-synctex=1","-interaction=nonstopmode","-file-line-error","-shell-escape","%DOC%"] }
  ],
  "latex-workshop.latex.recipes": [
    { "name": "PDFLaTeX ➜ View", "tools": ["pdflatex","pdflatex"] },
    { "name": "XeLaTeX ➜ View",  "tools": ["xelatex","xelatex"] },
    { "name": "LuaLaTeX ➜ View", "tools": ["lualatex","lualatex"] },
    { "name": "PDFLaTeX + Biber", "tools": ["pdflatex","biber","pdflatex","pdflatex"] },
    { "name": "PDFLaTeX (shell-escape)", "tools": ["pdflatex-shell","pdflatex-shell"] }
  ],
  "latex-workshop.view.pdf.viewer": "tab",              // built-in viewer
  "latex-workshop.latex.autoBuild.run": "onSave",       // optional: build on save
  "latex-workshop.message.error.show": false,           // optional: reduce popups
  "latex-workshop.message.warning.show": false
}
```

Use the recipe picker: **Ctrl+Shift+P** → “LaTeX Workshop: Build with recipe”.

---

## Compile LaTeX with TeXmaker on Windows or Linux

Here’s a quick, practical guide to getting productive with **TeXmaker** on Windows or Linux.

#### 1) Install the basics

* **Windows:** Install **MiKTeX** (easy) or **TeX Live** (complete).
* **Linux:** Install **TeX Live** via your package manager (e.g., `sudo apt install texlive-full` on Ubuntu/Debian).
* Then install **TeXmaker** (available for both platforms).

> Tip: If you’ll use `minted` for code highlighting, install Python + `pip install Pygments`.

### 2) First-run setup in TeXmaker (2 minutes)

Open **Options → Configure TeXmaker**:

**Commands**

* Ensure paths for `pdflatex`, `xelatex`, `lualatex`, `biber`, `bibtex` are auto-detected.
* For projects using `minted`, add **`-shell-escape`** to the **PdfLaTeX** command (e.g., `pdflatex -synctex=1 -interaction=nonstopmode -shell-escape %.tex`).

**Quick Build**

* Choose a preset matching your project:

  * **PDFLaTeX + Biber + PDFLaTeX (x2) + View PDF** (for `biblatex`/`biber`)
  * **PDFLaTeX + BibTeX + PDFLaTeX (x2) + View PDF** (for classic BibTeX)
  * **XeLaTeX + …** (if your template needs Unicode fonts or `fontspec`)
* Viewer: pick **Built-in PDF viewer** (easiest for SyncTeX).

### 3) Compile & preview

* Open your main `.tex` file (the one with `\begin{document}`).
* Click **Quick Build** (toolbar) to compile and open the PDF.
* Read errors in **Logs**; always fix the **first** error shown.

> SyncTeX: with the built-in viewer, you can jump between source and PDF (source ↔ PDF sync is on by default).
