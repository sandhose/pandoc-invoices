META = meta.yml
TEMPLATE = template.tex
TEMPLATE_QUOTES = quote.tex

INVOICES=$(wildcard invoices/*.md)
QUOTES=$(wildcard quotes/*.md)
OUT=$(INVOICES:invoices/%.md=invoices/out/%.pdf) $(QUOTES:quotes/%.md=quotes/out/%.pdf)

all: $(OUT)

invoices/out/%.pdf: invoices/%.md $(META) $(TEMPLATE)
	pandoc $(META) $< --template=$(TEMPLATE) -o $@ --pdf-engine=xelatex

quotes/out/%.pdf: quotes/%.md $(META) $(TEMPLATE_QUOTES)
	pandoc $(META) $< --template=$(TEMPLATE_QUOTES) -o $@ --pdf-engine=xelatex

clean:
	$(RM) $(OUT)

.PHONY: all clean
