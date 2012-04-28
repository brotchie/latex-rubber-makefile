#
# Generic makefile for building LaTeX documents
# with rubber. Requires:
#
# 		sudo apt-get install rubber
#

# Load any custom user config.
-include $(HOME)/.LatexCommonConfig.mk LatexCommonConfig.mk

# Location of rubber executable.
ifndef RUBBER
	RUBBER=rubber
endif

# Target defaults to the current directory name.
ifndef TARGET
	TARGET=$(notdir $(CURDIR))
endif

ifndef BIB_SRCS
	BIB_SRCS=$(wildcard *.bib)
endif

# Assume that other .tex files in the same directory are imported
# or included in the target document.
ifndef LATEX_SRCS
	LATEX_SRCS=$(wildcard *.tex)
endif

# Temporary files are stored in this directory.
ifndef BUILD_DIRECTORY
	BUILD_DIRECTORY=.build
endif

# pdf viewer to use for $(TARGET)-view target.
ifndef
	PDF_VIEWER=evince
endif

RUBBER_ARGS+=-d --into=$(BUILD_DIRECTORY) $(addprefix -I ,$(LATEX_INCLUDE_PATHS))

ifdef VERBOSE
	RUBBER_ARGS+=-vvv
endif

all: $(TARGET).pdf

# Creates the build directory.
$(BUILD_DIRECTORY):
	mkdir -p $(BUILD_DIRECTORY)

$(TARGET).pdf: $(LATEX_SRCS) $(BIB_SRCS) $(ADDITIONAL_DEPS) $(BUILD_DIRECTORY)
	$(RUBBER_PREFIX) $(RUBBER) $(RUBBER_ARGS) $<
	cp $(BUILD_DIRECTORY)/$@ $@

.PHONY: clean $(TARGET)-view view

view: $(TARGET)-view

$(TARGET)-view : $(TARGET).pdf
	@$(PDF_VIEWER) $< >/dev/null 2>/dev/null &

clean:
	rm -fr $(BUILD_DIRECTORY)
	rm -f $(TARGET).pdf
