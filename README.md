# *Thesis Latviensis*

> LaTeX document class and template for Bachelor's and Master's theses, as well as other academic papers at University of Latvia.

Designed to be fully compliant with the University's [Rules](https://www.lu.lv/fileadmin/user_upload/lu_portal/eng/general-information/documents/regulations/Requirements_for_elaboration_and_defending_of_graduation_papers.pdf) for formatting study papers. Example PDF created with this template is provided in the repository.

The STIX fonts provide a consistent typeface for both regular text and mathematics while being visually compatible with Times New Roman.

## Usage

Create a repository from this template on GitHub or Overleaf (pending), or fork it. As a student of University of Latvia, you are eligible for [Overleaf](https://www.overleaf.com/edu/lu) Professional when logged in with SSO (LUIS credentials). To get started, provide details about your work in the preambule.

By default, bilingualism is assumed for Latvian and English as primary and secondary languages respectively. You may change that by providing a key-value option for the document class: `\documentclass[languages={latvian,spanish,english}]{ThesisLatviensis}` (Babel syntax). Here, *`english`* is the primary language. Note that this does not provide translations for hard-coded macros in the document class file.

No directory structure (i.e. section and image folders) is provided intentionally so that one can implement it according to their need/preference. The main document is `main.tex`.

## License

Logotypes of University of Latvia contained in this repository are subject to copyright.

*Thesis Latviensis* is licensed under the Creative Commons Attribution 4.0 International Public License.
