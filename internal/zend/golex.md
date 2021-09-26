//    %yyc is a "macro" to access the "current" character.
//
//    %yyn is a "macro" to move to the "next" character.
//
//    %yyb is a "macro" to return the beginning-of-line status (a bool typed value).
//        It is used for patterns like `^re`.
//        Example: %yyb prev == 0 || prev == '\n'
//
//    %yyt is a "macro" to return the top/current start condition (an int typed value).
//        It is used when there are patterns with conditions like `<cond>re`.
//        Example: %yyt startCond