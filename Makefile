CONVERT = magick
IMAGES = $(shell find ./docs/materiály -maxdepth 1 -type f \
    \( -iname "*.jpg" -o \
       -iname "*.jpeg" -o \
       -iname "*.png" -o \
       -iname "*.gif" -o \
       -iname "*.bmp" -o \
       -iname "*.tiff" \) \
    -not -iname "*.webp")

.PHONY: convert
convert: $(IMAGES:=.webp)

%.webp: %
	$(CONVERT) "$<" -quality 80 "$@"
	rm "$<"
