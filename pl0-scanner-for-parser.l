%{
  #include <stdio.h>
  #include <string.h>
  #include "tokentable.h"
  int line_number = 1;
%}
%%
[[:blank:]]+		{}
\n			{ line_number += 1; }
"const"			{ return T_CONST;   }
"var"			{ return T_VAR;     }
"function"		{ return T_FUNC;    }
"begin"			{ return T_BEGIN;   }
"end"			{ return T_END;     }
"if"			{ return T_IF;      }
"then"			{ return T_THEN;    }
"while"			{ return T_WHILE;   }
"do"			{ return T_DO;      }
"return"		{ return T_RETURN;  }
"write"			{ return T_WRITE;   }
"writeln"		{ return T_WRITELN; }
"odd"			{ return T_ODD;     }
":="			{ return T_COLEQ;   }
"="			{ return T_EQ;      }
"<>"			{ return T_NOTEQ;   }
"<"			{ return T_LT;      }
">"			{ return T_GT;      }
"<="			{ return T_LE;      }
">="			{ return T_GE;      }
"."			{ return T_PERIOD;  }
";"			{ return T_SEMIC;   }
","			{ return T_COMMA;   }
"("			{ return T_LPAR;    }
")"			{ return T_RPAR;    }
"+"			{ return T_PLUS;    }
"-"			{ return T_MINUS;   }
"*"			{ return T_MULTI;   }
"/"			{ return T_DIVIDE;  }
[[:alpha:]][[:alpha:][:digit:]_]*    { return T_ID; }
[[:digit:]]+|"0x"[0-9a-h]+    { return T_NUMBER;   }
.                             { return T_ERROR; }
%%
