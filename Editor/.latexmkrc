# .latexmkrc

# upLaTeX (default)
$latex            = 'uplatex -synctex=1 -halt-on-error -file-line-error %O %S';
$bibtex           = 'upbibtex %O %S';
$biber            = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';
$makeindex        = 'upmendex %O -o %D %S';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$pdf_mode         = 3;

# Prevent extra files from staying around
$postscript_mode  = $dvi_mode = 0;
