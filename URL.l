%{
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap

%%

"https://"[a-zA-Z0-9.-]+    { return URL_VALIDA; }
"http://"[a-zA-Z0-9.-]+     { return URL_VALIDA; }
.                         { return URL_INVALIDA; }

%%

