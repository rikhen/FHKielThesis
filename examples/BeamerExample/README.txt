TODO:
* Check use of sections and subsections.
* Replace content (use from other examples).
* Add links to templates, manuals.


PROBLEMS:
* hyperref: beamer loads hyperref and url, but url must be loaded before hyperref! Move to class files?
* hypcap: must remove otions in hgb.sty for compatibility with beamer
* url: options clash with beamer
* enumitem: https://tex.stackexchange.com/questions/24371/does-enumitem-conflict-with-beamer-for-lists/24491#24491
	This handles the incopatibility between beamer and enumitem (used by hgb.sty).
* do we need to load hgb.sty at all?