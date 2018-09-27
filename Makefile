META = meta.yml
TEMPLATE = template.tex

INVOICES=$(wildcard invoices/*)
OUT=$(INVOICES:invoices/%.yml=out/%.pdf)

all: $(OUT)

out/%.pdf: invoices/%.yml $(META) $(TEMPLATE)
	pandoc $(META) $< --template=$(TEMPLATE) -o $@ --pdf-engine=xelatex

clean:
	$(RM) $(OUT)

.PHONY: all clean
