# Convert Markdown (resume.md) to DOCX and PDF
# prerequisites(Mac): pandoc, basictex

RESUME = resume.md
OUTPUT_DIR = output
BRANCH_NAME := $(shell git rev-parse --abbrev-ref HEAD)
FONTS_DIR = fonts

all: docx pdf

docx:
	@mkdir -p $(OUTPUT_DIR)
	pandoc $(RESUME) -o $(OUTPUT_DIR)/BinhBD_resume-$(BRANCH_NAME).docx

pdf:
	@mkdir -p $(OUTPUT_DIR)
	cp -r $(FONTS_DIR)/* $(OUTPUT_DIR)/
	pandoc $(RESUME) -o $(OUTPUT_DIR)/BinhBD_resume-$(BRANCH_NAME).pdf \
		--pdf-engine=xelatex \
		--variable mainfont="JetBrainsMono-Regular" \
		--variable geometry:margin=1in \
		--variable fontsize=12pt \
		--variable documentclass=article \
		--variable classoption=twoside \
		--variable classoption=a4paper \
		--variable lang=en \
		--variable toc-depth=2 \
		--variable toc-own-page=true \
		--variable indent=true \
		--pdf-engine-opt=--shell-escape

clean:
	rm -rf $(OUTPUT_DIR)

.PHONY: all docx pdf clean
