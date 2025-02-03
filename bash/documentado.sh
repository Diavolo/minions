#!/bin/bash
#
#  ██████╗  █████╗ ██╗  ██╗██████╗    ███╗   ██╗███████╗████████╗
# ██╔════╝ ██╔══██╗██║  ██║██╔══██╗   ████╗  ██║██╔════╝╚══██╔══╝
# ██║  ███╗███████║███████║██║  ██║   ██╔██╗ ██║█████╗     ██║
# ██║   ██║██╔══██║██╔══██║██║  ██║   ██║╚██╗██║██╔══╝     ██║
# ╚██████╔╝██║  ██║██║  ██║██████╔╝██╗██║ ╚████║███████╗   ██║
#  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝
#   ____  ___  _   _ ____
#  / ___|/ _ \| | | |  _ \   minions/bash/documentado.sh
# | |  _| |_| | |_| | | | |
# | |_| |  _  |  _  | |_| |  Gustavo Huarcaya
#  \____|_| |_|_| |_|____/   https://gahd.net
#
# CV Documentado
#
set -e
# apt install qpdf

cd ~/Areas/me/cv

CV_FILE="gustavo-huarcaya-fullstack-cv.pdf"

# Output filename
OUTPUT_FILE="documentado.pdf"
TEMP_DIR="temp_pdfs"

WORK_PDF="work.pdf"
STUDY_PDF="study.pdf"

# Get current date and time like YYYY-MM-DD-HHMMSS (e.g.: 2025-02-15-223344)
TODAY=$(date +%Y-%m-%d-%H%M%S)

# Backup OUTPUT_FILE if it exists
if [[ -f "$OUTPUT_FILE" ]]; then
    BACKUP_FILE="${TODAY}-${OUTPUT_FILE}"
    mv "$OUTPUT_FILE" "$BACKUP_FILE"
    echo "Backup created: $BACKUP_FILE"
fi

# Remove previous TEMP_DIR
if [[ -d "$TEMP_DIR" ]]; then
    rm -rf "$TEMP_DIR"
    echo "Cleaned: $TEMP_DIR"
fi

# Create TEMP_DIR to work with pdf files
mkdir -p "$TEMP_DIR/"{work/optimized,study/optimized}

cp work/*.pdf $TEMP_DIR/work
cp study/**/*.pdf $TEMP_DIR/study

# Find and order PDF files by name, from recent to oldest
# FILES=$(find dir1 dir2 dir3 -type f -name "*.pdf" | sort -rV)
WORK_FILES=$(find $TEMP_DIR/work -type f -name "*.pdf" | sort -rV)
STUDY_FILES=$(find $TEMP_DIR/study -type f -name "*.pdf" | sort -rV)

# Verify it there are PDF files to work
if [[ -z "$WORK_FILES" ]]; then
    echo "PDF files not found."
    exit 1
fi
if [[ -z "$STUDY_FILES" ]]; then
    echo "PDF files not found."
    exit 1
fi

ORDERED_STUDY_FILES=()
# Optimize each PDF before to join
for file in $STUDY_FILES; do
    base_name=$(basename "$file")
    OUTPUT_PATH="$TEMP_DIR/study/optimized/$base_name"
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$OUTPUT_PATH" "$file"
    ORDERED_STUDY_FILES+=("$OUTPUT_PATH")
done

# Join optimized and ordered PDFs
qpdf --empty --pages "${ORDERED_STUDY_FILES[@]}" -- "${TEMP_DIR}/${STUDY_PDF}"
qpdf --empty --pages "${WORK_FILES}" -- "${TEMP_DIR}/${WORK_PDF}"

# Join PDFs to make OUTPUT_FILE
qpdf --empty --pages "${CV_FILE}" "${TEMP_DIR}/${WORK_PDF}" "${TEMP_DIR}/${STUDY_PDF}" -- "$OUTPUT_FILE"

# Clean TEMP_DIR
rm -rf "$TEMP_DIR"

echo "PDF created: $OUTPUT_FILE"

# apt install pdftk
# pdftk file1.pdf file2.pdf file3.pdf cat output output.pdf
