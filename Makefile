.PHONY: generate manuscript summary run clean help
.DEFAULT_GOAL = help

define colorecho
	@tput setaf $2
	@echo $1
	@tput sgr0
endef

define pdf
	mkdir -p output
	asciidoctor -a nofooter $(1) -o tmp.html
	wkhtmltopdf -q tmp.html output/${2}.pdf
	rm tmp.html
endef

define rawhtml
	mkdir -p output
	asciidoctor -a nofooter -a stylesheet! ${1} -D output -o ${2}.html
endef

generate: manuscript summary

manuscript: output/manuscript.pdf output/manuscript.html

output/manuscript.pdf: content/manuscript.adoc assets/styles/manuscript.css
	$(call colorecho,"[Generate: $@]",3)
	$(call pdf,content/manuscript.adoc,manuscript)

output/manuscript.html: content/manuscript.adoc
	$(call colorecho,"[Generate: $@]",3)
	$(call rawhtml,content/manuscript.adoc,manuscript)

summary: output/summary.pdf

output/summary.pdf: notes/summary.adoc assets/styles/info.css
	$(call colorecho,"[Generate: $@]",3)
	$(call pdf,notes/summary.adoc,summary)

action = help
run:
	$(call colorecho,"[Run: assets/scripts/actions/$(action).sh]",3)
	@/bin/sh -c "./assets/scripts/actions/$(action).sh"

clean:
	@rm -rf output/

help:
	@/bin/sh -c "./assets/scripts/commands/help.sh"
