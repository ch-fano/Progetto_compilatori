// A Bison parser, made by GNU Bison 3.8.2.

// Skeleton implementation for Bison LALR(1) parsers in C++

// Copyright (C) 2002-2015, 2018-2021 Free Software Foundation, Inc.

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// As a special exception, you may create a larger work that contains
// part or all of the Bison parser skeleton and distribute that work
// under terms of your choice, so long as that work isn't itself a
// parser generator using the skeleton or a modified version thereof
// as a parser skeleton.  Alternatively, if you modify or redistribute
// the parser skeleton itself, you may (at your option) remove this
// special exception, which will cause the skeleton and the resulting
// Bison output files to be licensed under the GNU General Public
// License without this special exception.

// This special exception was added by the Free Software Foundation in
// version 2.2 of Bison.

// DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
// especially those whose name start with YY_ or yy_.  They are
// private implementation details that can be changed or removed.





#include "parser.hpp"


// Unqualified %code blocks.
#line 39 "parser.yy"

# include "driver.hpp"

#line 50 "parser.cpp"


#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> // FIXME: INFRINGES ON USER NAME SPACE.
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif


// Whether we are compiled with exception support.
#ifndef YY_EXCEPTIONS
# if defined __GNUC__ && !defined __EXCEPTIONS
#  define YY_EXCEPTIONS 0
# else
#  define YY_EXCEPTIONS 1
# endif
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K].location)
/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

# ifndef YYLLOC_DEFAULT
#  define YYLLOC_DEFAULT(Current, Rhs, N)                               \
    do                                                                  \
      if (N)                                                            \
        {                                                               \
          (Current).begin  = YYRHSLOC (Rhs, 1).begin;                   \
          (Current).end    = YYRHSLOC (Rhs, N).end;                     \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).begin = (Current).end = YYRHSLOC (Rhs, 0).end;      \
        }                                                               \
    while (false)
# endif


// Enable debugging if requested.
#if YYDEBUG

// A pseudo ostream that takes yydebug_ into account.
# define YYCDEBUG if (yydebug_) (*yycdebug_)

# define YY_SYMBOL_PRINT(Title, Symbol)         \
  do {                                          \
    if (yydebug_)                               \
    {                                           \
      *yycdebug_ << Title << ' ';               \
      yy_print_ (*yycdebug_, Symbol);           \
      *yycdebug_ << '\n';                       \
    }                                           \
  } while (false)

# define YY_REDUCE_PRINT(Rule)          \
  do {                                  \
    if (yydebug_)                       \
      yy_reduce_print_ (Rule);          \
  } while (false)

# define YY_STACK_PRINT()               \
  do {                                  \
    if (yydebug_)                       \
      yy_stack_print_ ();                \
  } while (false)

#else // !YYDEBUG

# define YYCDEBUG if (false) std::cerr
# define YY_SYMBOL_PRINT(Title, Symbol)  YY_USE (Symbol)
# define YY_REDUCE_PRINT(Rule)           static_cast<void> (0)
# define YY_STACK_PRINT()                static_cast<void> (0)

#endif // !YYDEBUG

#define yyerrok         (yyerrstatus_ = 0)
#define yyclearin       (yyla.clear ())

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYRECOVERING()  (!!yyerrstatus_)

namespace yy {
#line 142 "parser.cpp"

  /// Build a parser object.
  parser::parser (driver& drv_yyarg)
#if YYDEBUG
    : yydebug_ (false),
      yycdebug_ (&std::cerr),
#else
    :
#endif
      drv (drv_yyarg)
  {}

  parser::~parser ()
  {}

  parser::syntax_error::~syntax_error () YY_NOEXCEPT YY_NOTHROW
  {}

  /*---------.
  | symbol.  |
  `---------*/



  // by_state.
  parser::by_state::by_state () YY_NOEXCEPT
    : state (empty_state)
  {}

  parser::by_state::by_state (const by_state& that) YY_NOEXCEPT
    : state (that.state)
  {}

  void
  parser::by_state::clear () YY_NOEXCEPT
  {
    state = empty_state;
  }

  void
  parser::by_state::move (by_state& that)
  {
    state = that.state;
    that.clear ();
  }

  parser::by_state::by_state (state_type s) YY_NOEXCEPT
    : state (s)
  {}

  parser::symbol_kind_type
  parser::by_state::kind () const YY_NOEXCEPT
  {
    if (state == empty_state)
      return symbol_kind::S_YYEMPTY;
    else
      return YY_CAST (symbol_kind_type, yystos_[+state]);
  }

  parser::stack_symbol_type::stack_symbol_type ()
  {}

  parser::stack_symbol_type::stack_symbol_type (YY_RVREF (stack_symbol_type) that)
    : super_type (YY_MOVE (that.state), YY_MOVE (that.location))
  {
    switch (that.kind ())
    {
      case symbol_kind::S_assignment: // assignment
        value.YY_MOVE_OR_COPY< AssignmentExprAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_block: // block
        value.YY_MOVE_OR_COPY< BlockExprAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_stmt: // stmt
      case symbol_kind::S_exp: // exp
      case symbol_kind::S_initexp: // initexp
      case symbol_kind::S_expif: // expif
      case symbol_kind::S_condexp: // condexp
      case symbol_kind::S_idexp: // idexp
        value.YY_MOVE_OR_COPY< ExprAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_forstmt: // forstmt
        value.YY_MOVE_OR_COPY< ForExprAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_definition: // definition
        value.YY_MOVE_OR_COPY< FunctionAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_globalvar: // globalvar
        value.YY_MOVE_OR_COPY< GlobalVarExprAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_ifstmt: // ifstmt
        value.YY_MOVE_OR_COPY< IfExprAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_init: // init
        value.YY_MOVE_OR_COPY< InitAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_external: // external
      case symbol_kind::S_proto: // proto
        value.YY_MOVE_OR_COPY< PrototypeAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_program: // program
      case symbol_kind::S_top: // top
        value.YY_MOVE_OR_COPY< RootAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_binding: // binding
        value.YY_MOVE_OR_COPY< VarBindingAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_NUMBER: // "number"
        value.YY_MOVE_OR_COPY< double > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_IDENTIFIER: // "id"
        value.YY_MOVE_OR_COPY< std::string > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_stmts: // stmts
      case symbol_kind::S_optexp: // optexp
      case symbol_kind::S_explist: // explist
        value.YY_MOVE_OR_COPY< std::vector<ExprAST*> > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_vardefs: // vardefs
        value.YY_MOVE_OR_COPY< std::vector<VarBindingAST*> > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_idseq: // idseq
        value.YY_MOVE_OR_COPY< std::vector<std::string> > (YY_MOVE (that.value));
        break;

      default:
        break;
    }

#if 201103L <= YY_CPLUSPLUS
    // that is emptied.
    that.state = empty_state;
#endif
  }

  parser::stack_symbol_type::stack_symbol_type (state_type s, YY_MOVE_REF (symbol_type) that)
    : super_type (s, YY_MOVE (that.location))
  {
    switch (that.kind ())
    {
      case symbol_kind::S_assignment: // assignment
        value.move< AssignmentExprAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_block: // block
        value.move< BlockExprAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_stmt: // stmt
      case symbol_kind::S_exp: // exp
      case symbol_kind::S_initexp: // initexp
      case symbol_kind::S_expif: // expif
      case symbol_kind::S_condexp: // condexp
      case symbol_kind::S_idexp: // idexp
        value.move< ExprAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_forstmt: // forstmt
        value.move< ForExprAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_definition: // definition
        value.move< FunctionAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_globalvar: // globalvar
        value.move< GlobalVarExprAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_ifstmt: // ifstmt
        value.move< IfExprAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_init: // init
        value.move< InitAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_external: // external
      case symbol_kind::S_proto: // proto
        value.move< PrototypeAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_program: // program
      case symbol_kind::S_top: // top
        value.move< RootAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_binding: // binding
        value.move< VarBindingAST* > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_NUMBER: // "number"
        value.move< double > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_IDENTIFIER: // "id"
        value.move< std::string > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_stmts: // stmts
      case symbol_kind::S_optexp: // optexp
      case symbol_kind::S_explist: // explist
        value.move< std::vector<ExprAST*> > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_vardefs: // vardefs
        value.move< std::vector<VarBindingAST*> > (YY_MOVE (that.value));
        break;

      case symbol_kind::S_idseq: // idseq
        value.move< std::vector<std::string> > (YY_MOVE (that.value));
        break;

      default:
        break;
    }

    // that is emptied.
    that.kind_ = symbol_kind::S_YYEMPTY;
  }

#if YY_CPLUSPLUS < 201103L
  parser::stack_symbol_type&
  parser::stack_symbol_type::operator= (const stack_symbol_type& that)
  {
    state = that.state;
    switch (that.kind ())
    {
      case symbol_kind::S_assignment: // assignment
        value.copy< AssignmentExprAST* > (that.value);
        break;

      case symbol_kind::S_block: // block
        value.copy< BlockExprAST* > (that.value);
        break;

      case symbol_kind::S_stmt: // stmt
      case symbol_kind::S_exp: // exp
      case symbol_kind::S_initexp: // initexp
      case symbol_kind::S_expif: // expif
      case symbol_kind::S_condexp: // condexp
      case symbol_kind::S_idexp: // idexp
        value.copy< ExprAST* > (that.value);
        break;

      case symbol_kind::S_forstmt: // forstmt
        value.copy< ForExprAST* > (that.value);
        break;

      case symbol_kind::S_definition: // definition
        value.copy< FunctionAST* > (that.value);
        break;

      case symbol_kind::S_globalvar: // globalvar
        value.copy< GlobalVarExprAST* > (that.value);
        break;

      case symbol_kind::S_ifstmt: // ifstmt
        value.copy< IfExprAST* > (that.value);
        break;

      case symbol_kind::S_init: // init
        value.copy< InitAST* > (that.value);
        break;

      case symbol_kind::S_external: // external
      case symbol_kind::S_proto: // proto
        value.copy< PrototypeAST* > (that.value);
        break;

      case symbol_kind::S_program: // program
      case symbol_kind::S_top: // top
        value.copy< RootAST* > (that.value);
        break;

      case symbol_kind::S_binding: // binding
        value.copy< VarBindingAST* > (that.value);
        break;

      case symbol_kind::S_NUMBER: // "number"
        value.copy< double > (that.value);
        break;

      case symbol_kind::S_IDENTIFIER: // "id"
        value.copy< std::string > (that.value);
        break;

      case symbol_kind::S_stmts: // stmts
      case symbol_kind::S_optexp: // optexp
      case symbol_kind::S_explist: // explist
        value.copy< std::vector<ExprAST*> > (that.value);
        break;

      case symbol_kind::S_vardefs: // vardefs
        value.copy< std::vector<VarBindingAST*> > (that.value);
        break;

      case symbol_kind::S_idseq: // idseq
        value.copy< std::vector<std::string> > (that.value);
        break;

      default:
        break;
    }

    location = that.location;
    return *this;
  }

  parser::stack_symbol_type&
  parser::stack_symbol_type::operator= (stack_symbol_type& that)
  {
    state = that.state;
    switch (that.kind ())
    {
      case symbol_kind::S_assignment: // assignment
        value.move< AssignmentExprAST* > (that.value);
        break;

      case symbol_kind::S_block: // block
        value.move< BlockExprAST* > (that.value);
        break;

      case symbol_kind::S_stmt: // stmt
      case symbol_kind::S_exp: // exp
      case symbol_kind::S_initexp: // initexp
      case symbol_kind::S_expif: // expif
      case symbol_kind::S_condexp: // condexp
      case symbol_kind::S_idexp: // idexp
        value.move< ExprAST* > (that.value);
        break;

      case symbol_kind::S_forstmt: // forstmt
        value.move< ForExprAST* > (that.value);
        break;

      case symbol_kind::S_definition: // definition
        value.move< FunctionAST* > (that.value);
        break;

      case symbol_kind::S_globalvar: // globalvar
        value.move< GlobalVarExprAST* > (that.value);
        break;

      case symbol_kind::S_ifstmt: // ifstmt
        value.move< IfExprAST* > (that.value);
        break;

      case symbol_kind::S_init: // init
        value.move< InitAST* > (that.value);
        break;

      case symbol_kind::S_external: // external
      case symbol_kind::S_proto: // proto
        value.move< PrototypeAST* > (that.value);
        break;

      case symbol_kind::S_program: // program
      case symbol_kind::S_top: // top
        value.move< RootAST* > (that.value);
        break;

      case symbol_kind::S_binding: // binding
        value.move< VarBindingAST* > (that.value);
        break;

      case symbol_kind::S_NUMBER: // "number"
        value.move< double > (that.value);
        break;

      case symbol_kind::S_IDENTIFIER: // "id"
        value.move< std::string > (that.value);
        break;

      case symbol_kind::S_stmts: // stmts
      case symbol_kind::S_optexp: // optexp
      case symbol_kind::S_explist: // explist
        value.move< std::vector<ExprAST*> > (that.value);
        break;

      case symbol_kind::S_vardefs: // vardefs
        value.move< std::vector<VarBindingAST*> > (that.value);
        break;

      case symbol_kind::S_idseq: // idseq
        value.move< std::vector<std::string> > (that.value);
        break;

      default:
        break;
    }

    location = that.location;
    // that is emptied.
    that.state = empty_state;
    return *this;
  }
#endif

  template <typename Base>
  void
  parser::yy_destroy_ (const char* yymsg, basic_symbol<Base>& yysym) const
  {
    if (yymsg)
      YY_SYMBOL_PRINT (yymsg, yysym);
  }

#if YYDEBUG
  template <typename Base>
  void
  parser::yy_print_ (std::ostream& yyo, const basic_symbol<Base>& yysym) const
  {
    std::ostream& yyoutput = yyo;
    YY_USE (yyoutput);
    if (yysym.empty ())
      yyo << "empty symbol";
    else
      {
        symbol_kind_type yykind = yysym.kind ();
        yyo << (yykind < YYNTOKENS ? "token" : "nterm")
            << ' ' << yysym.name () << " ("
            << yysym.location << ": ";
        YY_USE (yykind);
        yyo << ')';
      }
  }
#endif

  void
  parser::yypush_ (const char* m, YY_MOVE_REF (stack_symbol_type) sym)
  {
    if (m)
      YY_SYMBOL_PRINT (m, sym);
    yystack_.push (YY_MOVE (sym));
  }

  void
  parser::yypush_ (const char* m, state_type s, YY_MOVE_REF (symbol_type) sym)
  {
#if 201103L <= YY_CPLUSPLUS
    yypush_ (m, stack_symbol_type (s, std::move (sym)));
#else
    stack_symbol_type ss (s, sym);
    yypush_ (m, ss);
#endif
  }

  void
  parser::yypop_ (int n) YY_NOEXCEPT
  {
    yystack_.pop (n);
  }

#if YYDEBUG
  std::ostream&
  parser::debug_stream () const
  {
    return *yycdebug_;
  }

  void
  parser::set_debug_stream (std::ostream& o)
  {
    yycdebug_ = &o;
  }


  parser::debug_level_type
  parser::debug_level () const
  {
    return yydebug_;
  }

  void
  parser::set_debug_level (debug_level_type l)
  {
    yydebug_ = l;
  }
#endif // YYDEBUG

  parser::state_type
  parser::yy_lr_goto_state_ (state_type yystate, int yysym)
  {
    int yyr = yypgoto_[yysym - YYNTOKENS] + yystate;
    if (0 <= yyr && yyr <= yylast_ && yycheck_[yyr] == yystate)
      return yytable_[yyr];
    else
      return yydefgoto_[yysym - YYNTOKENS];
  }

  bool
  parser::yy_pact_value_is_default_ (int yyvalue) YY_NOEXCEPT
  {
    return yyvalue == yypact_ninf_;
  }

  bool
  parser::yy_table_value_is_error_ (int yyvalue) YY_NOEXCEPT
  {
    return yyvalue == yytable_ninf_;
  }

  int
  parser::operator() ()
  {
    return parse ();
  }

  int
  parser::parse ()
  {
    int yyn;
    /// Length of the RHS of the rule being reduced.
    int yylen = 0;

    // Error handling.
    int yynerrs_ = 0;
    int yyerrstatus_ = 0;

    /// The lookahead symbol.
    symbol_type yyla;

    /// The locations where the error started and ended.
    stack_symbol_type yyerror_range[3];

    /// The return value of parse ().
    int yyresult;

#if YY_EXCEPTIONS
    try
#endif // YY_EXCEPTIONS
      {
    YYCDEBUG << "Starting parse\n";


    /* Initialize the stack.  The initial state will be set in
       yynewstate, since the latter expects the semantical and the
       location values to have been already stored, initialize these
       stacks with a primary value.  */
    yystack_.clear ();
    yypush_ (YY_NULLPTR, 0, YY_MOVE (yyla));

  /*-----------------------------------------------.
  | yynewstate -- push a new symbol on the stack.  |
  `-----------------------------------------------*/
  yynewstate:
    YYCDEBUG << "Entering state " << int (yystack_[0].state) << '\n';
    YY_STACK_PRINT ();

    // Accept?
    if (yystack_[0].state == yyfinal_)
      YYACCEPT;

    goto yybackup;


  /*-----------.
  | yybackup.  |
  `-----------*/
  yybackup:
    // Try to take a decision without lookahead.
    yyn = yypact_[+yystack_[0].state];
    if (yy_pact_value_is_default_ (yyn))
      goto yydefault;

    // Read a lookahead token.
    if (yyla.empty ())
      {
        YYCDEBUG << "Reading a token\n";
#if YY_EXCEPTIONS
        try
#endif // YY_EXCEPTIONS
          {
            symbol_type yylookahead (yylex (drv));
            yyla.move (yylookahead);
          }
#if YY_EXCEPTIONS
        catch (const syntax_error& yyexc)
          {
            YYCDEBUG << "Caught exception: " << yyexc.what() << '\n';
            error (yyexc);
            goto yyerrlab1;
          }
#endif // YY_EXCEPTIONS
      }
    YY_SYMBOL_PRINT ("Next token is", yyla);

    if (yyla.kind () == symbol_kind::S_YYerror)
    {
      // The scanner already issued an error message, process directly
      // to error recovery.  But do not keep the error token as
      // lookahead, it is too special and may lead us to an endless
      // loop in error recovery. */
      yyla.kind_ = symbol_kind::S_YYUNDEF;
      goto yyerrlab1;
    }

    /* If the proper action on seeing token YYLA.TYPE is to reduce or
       to detect an error, take that action.  */
    yyn += yyla.kind ();
    if (yyn < 0 || yylast_ < yyn || yycheck_[yyn] != yyla.kind ())
      {
        goto yydefault;
      }

    // Reduce or error.
    yyn = yytable_[yyn];
    if (yyn <= 0)
      {
        if (yy_table_value_is_error_ (yyn))
          goto yyerrlab;
        yyn = -yyn;
        goto yyreduce;
      }

    // Count tokens shifted since error; after three, turn off error status.
    if (yyerrstatus_)
      --yyerrstatus_;

    // Shift the lookahead token.
    yypush_ ("Shifting", state_type (yyn), YY_MOVE (yyla));
    goto yynewstate;


  /*-----------------------------------------------------------.
  | yydefault -- do the default action for the current state.  |
  `-----------------------------------------------------------*/
  yydefault:
    yyn = yydefact_[+yystack_[0].state];
    if (yyn == 0)
      goto yyerrlab;
    goto yyreduce;


  /*-----------------------------.
  | yyreduce -- do a reduction.  |
  `-----------------------------*/
  yyreduce:
    yylen = yyr2_[yyn];
    {
      stack_symbol_type yylhs;
      yylhs.state = yy_lr_goto_state_ (yystack_[yylen].state, yyr1_[yyn]);
      /* Variants are always initialized to an empty instance of the
         correct type. The default '$$ = $1' action is NOT applied
         when using variants.  */
      switch (yyr1_[yyn])
    {
      case symbol_kind::S_assignment: // assignment
        yylhs.value.emplace< AssignmentExprAST* > ();
        break;

      case symbol_kind::S_block: // block
        yylhs.value.emplace< BlockExprAST* > ();
        break;

      case symbol_kind::S_stmt: // stmt
      case symbol_kind::S_exp: // exp
      case symbol_kind::S_initexp: // initexp
      case symbol_kind::S_expif: // expif
      case symbol_kind::S_condexp: // condexp
      case symbol_kind::S_idexp: // idexp
        yylhs.value.emplace< ExprAST* > ();
        break;

      case symbol_kind::S_forstmt: // forstmt
        yylhs.value.emplace< ForExprAST* > ();
        break;

      case symbol_kind::S_definition: // definition
        yylhs.value.emplace< FunctionAST* > ();
        break;

      case symbol_kind::S_globalvar: // globalvar
        yylhs.value.emplace< GlobalVarExprAST* > ();
        break;

      case symbol_kind::S_ifstmt: // ifstmt
        yylhs.value.emplace< IfExprAST* > ();
        break;

      case symbol_kind::S_init: // init
        yylhs.value.emplace< InitAST* > ();
        break;

      case symbol_kind::S_external: // external
      case symbol_kind::S_proto: // proto
        yylhs.value.emplace< PrototypeAST* > ();
        break;

      case symbol_kind::S_program: // program
      case symbol_kind::S_top: // top
        yylhs.value.emplace< RootAST* > ();
        break;

      case symbol_kind::S_binding: // binding
        yylhs.value.emplace< VarBindingAST* > ();
        break;

      case symbol_kind::S_NUMBER: // "number"
        yylhs.value.emplace< double > ();
        break;

      case symbol_kind::S_IDENTIFIER: // "id"
        yylhs.value.emplace< std::string > ();
        break;

      case symbol_kind::S_stmts: // stmts
      case symbol_kind::S_optexp: // optexp
      case symbol_kind::S_explist: // explist
        yylhs.value.emplace< std::vector<ExprAST*> > ();
        break;

      case symbol_kind::S_vardefs: // vardefs
        yylhs.value.emplace< std::vector<VarBindingAST*> > ();
        break;

      case symbol_kind::S_idseq: // idseq
        yylhs.value.emplace< std::vector<std::string> > ();
        break;

      default:
        break;
    }


      // Default location.
      {
        stack_type::slice range (yystack_, yylen);
        YYLLOC_DEFAULT (yylhs.location, range, yylen);
        yyerror_range[1].location = yylhs.location;
      }

      // Perform the reduction.
      YY_REDUCE_PRINT (yyn);
#if YY_EXCEPTIONS
      try
#endif // YY_EXCEPTIONS
        {
          switch (yyn)
            {
  case 2: // startsymb: program
#line 103 "parser.yy"
                        { drv.root = yystack_[0].value.as < RootAST* > (); }
#line 901 "parser.cpp"
    break;

  case 3: // program: %empty
#line 106 "parser.yy"
                        { yylhs.value.as < RootAST* > () = new SeqAST(nullptr,nullptr); }
#line 907 "parser.cpp"
    break;

  case 4: // program: top ";" program
#line 107 "parser.yy"
                        { yylhs.value.as < RootAST* > () = new SeqAST(yystack_[2].value.as < RootAST* > (),yystack_[0].value.as < RootAST* > ()); }
#line 913 "parser.cpp"
    break;

  case 5: // top: %empty
#line 110 "parser.yy"
                        { yylhs.value.as < RootAST* > () = nullptr; }
#line 919 "parser.cpp"
    break;

  case 6: // top: definition
#line 111 "parser.yy"
                        { yylhs.value.as < RootAST* > () = yystack_[0].value.as < FunctionAST* > (); }
#line 925 "parser.cpp"
    break;

  case 7: // top: external
#line 112 "parser.yy"
                        { yylhs.value.as < RootAST* > () = yystack_[0].value.as < PrototypeAST* > (); }
#line 931 "parser.cpp"
    break;

  case 8: // top: globalvar
#line 113 "parser.yy"
                        { yylhs.value.as < RootAST* > () = yystack_[0].value.as < GlobalVarExprAST* > (); }
#line 937 "parser.cpp"
    break;

  case 9: // definition: "def" proto block
#line 116 "parser.yy"
                        { yylhs.value.as < FunctionAST* > () = new FunctionAST(yystack_[1].value.as < PrototypeAST* > (),yystack_[0].value.as < BlockExprAST* > ()); yystack_[1].value.as < PrototypeAST* > ()->noemit(); }
#line 943 "parser.cpp"
    break;

  case 10: // external: "extern" proto
#line 119 "parser.yy"
                        { yylhs.value.as < PrototypeAST* > () = yystack_[0].value.as < PrototypeAST* > (); }
#line 949 "parser.cpp"
    break;

  case 11: // proto: "id" "(" idseq ")"
#line 122 "parser.yy"
                        { yylhs.value.as < PrototypeAST* > () = new PrototypeAST(yystack_[3].value.as < std::string > (),yystack_[1].value.as < std::vector<std::string> > ());  }
#line 955 "parser.cpp"
    break;

  case 12: // globalvar: "global" "id"
#line 125 "parser.yy"
                        { yylhs.value.as < GlobalVarExprAST* > () = new GlobalVarExprAST(yystack_[0].value.as < std::string > ()); }
#line 961 "parser.cpp"
    break;

  case 13: // idseq: %empty
#line 128 "parser.yy"
                        { std::vector<std::string> args;
                         yylhs.value.as < std::vector<std::string> > () = args; }
#line 968 "parser.cpp"
    break;

  case 14: // idseq: "id" idseq
#line 130 "parser.yy"
                        { yystack_[0].value.as < std::vector<std::string> > ().insert(yystack_[0].value.as < std::vector<std::string> > ().begin(),yystack_[1].value.as < std::string > ()); yylhs.value.as < std::vector<std::string> > () = yystack_[0].value.as < std::vector<std::string> > (); }
#line 974 "parser.cpp"
    break;

  case 15: // stmts: stmt
#line 133 "parser.yy"
                        { std::vector<ExprAST*> statements;
                            statements.push_back(yystack_[0].value.as < ExprAST* > ());
                            yylhs.value.as < std::vector<ExprAST*> > () = statements; }
#line 982 "parser.cpp"
    break;

  case 16: // stmts: stmt ";" stmts
#line 136 "parser.yy"
                        { yystack_[0].value.as < std::vector<ExprAST*> > ().insert(yystack_[0].value.as < std::vector<ExprAST*> > ().begin(), yystack_[2].value.as < ExprAST* > ()); 
                            yylhs.value.as < std::vector<ExprAST*> > () = yystack_[0].value.as < std::vector<ExprAST*> > (); }
#line 989 "parser.cpp"
    break;

  case 17: // stmt: assignment
#line 140 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = yystack_[0].value.as < AssignmentExprAST* > (); }
#line 995 "parser.cpp"
    break;

  case 18: // stmt: block
#line 141 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = yystack_[0].value.as < BlockExprAST* > (); }
#line 1001 "parser.cpp"
    break;

  case 19: // stmt: ifstmt
#line 142 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = yystack_[0].value.as < IfExprAST* > (); }
#line 1007 "parser.cpp"
    break;

  case 20: // stmt: forstmt
#line 143 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = yystack_[0].value.as < ForExprAST* > (); }
#line 1013 "parser.cpp"
    break;

  case 21: // stmt: exp
#line 144 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = yystack_[0].value.as < ExprAST* > (); }
#line 1019 "parser.cpp"
    break;

  case 22: // ifstmt: "if" "(" condexp ")" stmt "else" stmt
#line 147 "parser.yy"
                                         { yylhs.value.as < IfExprAST* > () = new IfExprAST(yystack_[4].value.as < ExprAST* > (), yystack_[2].value.as < ExprAST* > (), yystack_[0].value.as < ExprAST* > ()); }
#line 1025 "parser.cpp"
    break;

  case 23: // ifstmt: "if" "(" condexp ")" stmt
#line 148 "parser.yy"
                                         { yylhs.value.as < IfExprAST* > () = new IfExprAST(yystack_[2].value.as < ExprAST* > (), yystack_[0].value.as < ExprAST* > (), nullptr); }
#line 1031 "parser.cpp"
    break;

  case 24: // forstmt: "for" "(" init ";" condexp ";" assignment ")" stmt
#line 151 "parser.yy"
                                                      { yylhs.value.as < ForExprAST* > () =  new ForExprAST(yystack_[6].value.as < InitAST* > (), yystack_[4].value.as < ExprAST* > (), yystack_[2].value.as < AssignmentExprAST* > (), yystack_[0].value.as < ExprAST* > ()); }
#line 1037 "parser.cpp"
    break;

  case 25: // init: binding
#line 154 "parser.yy"
                        { yystack_[0].value.as < VarBindingAST* > ()->setBinding(true);
                          yylhs.value.as < InitAST* > () = yystack_[0].value.as < VarBindingAST* > (); }
#line 1044 "parser.cpp"
    break;

  case 26: // init: assignment
#line 156 "parser.yy"
                        { yystack_[0].value.as < AssignmentExprAST* > ()->setBinding(false);
                          yylhs.value.as < InitAST* > () = yystack_[0].value.as < AssignmentExprAST* > (); }
#line 1051 "parser.cpp"
    break;

  case 27: // assignment: "id" "=" exp
#line 160 "parser.yy"
                        { yylhs.value.as < AssignmentExprAST* > () = new AssignmentExprAST(yystack_[2].value.as < std::string > (), yystack_[0].value.as < ExprAST* > ()); }
#line 1057 "parser.cpp"
    break;

  case 28: // assignment: "++" "id"
#line 161 "parser.yy"
                        { ExprAST * var= new VariableExprAST(yystack_[0].value.as < std::string > ());
                          ExprAST * num = new NumberExprAST(1.0);
                          ExprAST * expr = new BinaryExprAST('+', var, num);
                          yylhs.value.as < AssignmentExprAST* > () = new AssignmentExprAST(yystack_[0].value.as < std::string > (), expr); }
#line 1066 "parser.cpp"
    break;

  case 29: // assignment: "--" "id"
#line 165 "parser.yy"
                        { ExprAST * var= new VariableExprAST(yystack_[0].value.as < std::string > ());
                          ExprAST * num = new NumberExprAST(1.0);
                          ExprAST * expr = new BinaryExprAST('-', var, num);
                          yylhs.value.as < AssignmentExprAST* > () = new AssignmentExprAST(yystack_[0].value.as < std::string > (), expr); }
#line 1075 "parser.cpp"
    break;

  case 30: // exp: exp "+" exp
#line 176 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = new BinaryExprAST('+',yystack_[2].value.as < ExprAST* > (),yystack_[0].value.as < ExprAST* > ()); }
#line 1081 "parser.cpp"
    break;

  case 31: // exp: exp "-" exp
#line 177 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = new BinaryExprAST('-',yystack_[2].value.as < ExprAST* > (),yystack_[0].value.as < ExprAST* > ()); }
#line 1087 "parser.cpp"
    break;

  case 32: // exp: exp "*" exp
#line 178 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = new BinaryExprAST('*',yystack_[2].value.as < ExprAST* > (),yystack_[0].value.as < ExprAST* > ()); }
#line 1093 "parser.cpp"
    break;

  case 33: // exp: exp "/" exp
#line 179 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = new BinaryExprAST('/',yystack_[2].value.as < ExprAST* > (),yystack_[0].value.as < ExprAST* > ()); }
#line 1099 "parser.cpp"
    break;

  case 34: // exp: idexp
#line 180 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = yystack_[0].value.as < ExprAST* > (); }
#line 1105 "parser.cpp"
    break;

  case 35: // exp: "(" exp ")"
#line 181 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = yystack_[1].value.as < ExprAST* > (); }
#line 1111 "parser.cpp"
    break;

  case 36: // exp: "number"
#line 182 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = new NumberExprAST(yystack_[0].value.as < double > ()); }
#line 1117 "parser.cpp"
    break;

  case 37: // exp: expif
#line 183 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = yystack_[0].value.as < ExprAST* > (); }
#line 1123 "parser.cpp"
    break;

  case 38: // block: "{" stmts "}"
#line 186 "parser.yy"
                            { std::vector<VarBindingAST *> def;
                      yylhs.value.as < BlockExprAST* > () = new BlockExprAST( def,yystack_[1].value.as < std::vector<ExprAST*> > ()); }
#line 1130 "parser.cpp"
    break;

  case 39: // block: "{" vardefs ";" stmts "}"
#line 188 "parser.yy"
                            { yylhs.value.as < BlockExprAST* > () = new BlockExprAST(yystack_[3].value.as < std::vector<VarBindingAST*> > (),yystack_[1].value.as < std::vector<ExprAST*> > ()); }
#line 1136 "parser.cpp"
    break;

  case 40: // vardefs: binding
#line 191 "parser.yy"
                          { std::vector<VarBindingAST*> definitions;
                            definitions.push_back(yystack_[0].value.as < VarBindingAST* > ());
                            yylhs.value.as < std::vector<VarBindingAST*> > () = definitions; }
#line 1144 "parser.cpp"
    break;

  case 41: // vardefs: vardefs ";" binding
#line 194 "parser.yy"
                          { yystack_[2].value.as < std::vector<VarBindingAST*> > ().push_back(yystack_[0].value.as < VarBindingAST* > ());
                            yylhs.value.as < std::vector<VarBindingAST*> > () = yystack_[2].value.as < std::vector<VarBindingAST*> > (); }
#line 1151 "parser.cpp"
    break;

  case 42: // binding: "var" "id" initexp
#line 198 "parser.yy"
                          { yylhs.value.as < VarBindingAST* > () = new VarBindingAST(yystack_[1].value.as < std::string > (),yystack_[0].value.as < ExprAST* > ()); }
#line 1157 "parser.cpp"
    break;

  case 43: // initexp: %empty
#line 201 "parser.yy"
                          { yylhs.value.as < ExprAST* > () = nullptr; }
#line 1163 "parser.cpp"
    break;

  case 44: // initexp: "=" exp
#line 202 "parser.yy"
                          { yylhs.value.as < ExprAST* > () = yystack_[0].value.as < ExprAST* > (); }
#line 1169 "parser.cpp"
    break;

  case 45: // expif: condexp "?" exp ":" exp
#line 205 "parser.yy"
                          { yylhs.value.as < ExprAST* > () = new IfExprAST(yystack_[4].value.as < ExprAST* > (),yystack_[2].value.as < ExprAST* > (),yystack_[0].value.as < ExprAST* > ()); }
#line 1175 "parser.cpp"
    break;

  case 46: // condexp: exp "<" exp
#line 208 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = new BinaryExprAST('<',yystack_[2].value.as < ExprAST* > (),yystack_[0].value.as < ExprAST* > ()); }
#line 1181 "parser.cpp"
    break;

  case 47: // condexp: exp "==" exp
#line 209 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = new BinaryExprAST('=',yystack_[2].value.as < ExprAST* > (),yystack_[0].value.as < ExprAST* > ()); }
#line 1187 "parser.cpp"
    break;

  case 48: // idexp: "id"
#line 212 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = new VariableExprAST(yystack_[0].value.as < std::string > ()); }
#line 1193 "parser.cpp"
    break;

  case 49: // idexp: "id" "(" optexp ")"
#line 213 "parser.yy"
                        { yylhs.value.as < ExprAST* > () = new CallExprAST(yystack_[3].value.as < std::string > (),yystack_[1].value.as < std::vector<ExprAST*> > ()); }
#line 1199 "parser.cpp"
    break;

  case 50: // optexp: %empty
#line 216 "parser.yy"
                        { std::vector<ExprAST*> args;
			 yylhs.value.as < std::vector<ExprAST*> > () = args; }
#line 1206 "parser.cpp"
    break;

  case 51: // optexp: explist
#line 218 "parser.yy"
                        { yylhs.value.as < std::vector<ExprAST*> > () = yystack_[0].value.as < std::vector<ExprAST*> > (); }
#line 1212 "parser.cpp"
    break;

  case 52: // explist: exp
#line 221 "parser.yy"
                        { std::vector<ExprAST*> args;
                         args.push_back(yystack_[0].value.as < ExprAST* > ());
			 yylhs.value.as < std::vector<ExprAST*> > () = args;
                        }
#line 1221 "parser.cpp"
    break;

  case 53: // explist: exp "," explist
#line 225 "parser.yy"
                        { yystack_[0].value.as < std::vector<ExprAST*> > ().insert(yystack_[0].value.as < std::vector<ExprAST*> > ().begin(), yystack_[2].value.as < ExprAST* > ()); yylhs.value.as < std::vector<ExprAST*> > () = yystack_[0].value.as < std::vector<ExprAST*> > (); }
#line 1227 "parser.cpp"
    break;


#line 1231 "parser.cpp"

            default:
              break;
            }
        }
#if YY_EXCEPTIONS
      catch (const syntax_error& yyexc)
        {
          YYCDEBUG << "Caught exception: " << yyexc.what() << '\n';
          error (yyexc);
          YYERROR;
        }
#endif // YY_EXCEPTIONS
      YY_SYMBOL_PRINT ("-> $$ =", yylhs);
      yypop_ (yylen);
      yylen = 0;

      // Shift the result of the reduction.
      yypush_ (YY_NULLPTR, YY_MOVE (yylhs));
    }
    goto yynewstate;


  /*--------------------------------------.
  | yyerrlab -- here on detecting error.  |
  `--------------------------------------*/
  yyerrlab:
    // If not already recovering from an error, report this error.
    if (!yyerrstatus_)
      {
        ++yynerrs_;
        context yyctx (*this, yyla);
        std::string msg = yysyntax_error_ (yyctx);
        error (yyla.location, YY_MOVE (msg));
      }


    yyerror_range[1].location = yyla.location;
    if (yyerrstatus_ == 3)
      {
        /* If just tried and failed to reuse lookahead token after an
           error, discard it.  */

        // Return failure if at end of input.
        if (yyla.kind () == symbol_kind::S_YYEOF)
          YYABORT;
        else if (!yyla.empty ())
          {
            yy_destroy_ ("Error: discarding", yyla);
            yyla.clear ();
          }
      }

    // Else will try to reuse lookahead token after shifting the error token.
    goto yyerrlab1;


  /*---------------------------------------------------.
  | yyerrorlab -- error raised explicitly by YYERROR.  |
  `---------------------------------------------------*/
  yyerrorlab:
    /* Pacify compilers when the user code never invokes YYERROR and
       the label yyerrorlab therefore never appears in user code.  */
    if (false)
      YYERROR;

    /* Do not reclaim the symbols of the rule whose action triggered
       this YYERROR.  */
    yypop_ (yylen);
    yylen = 0;
    YY_STACK_PRINT ();
    goto yyerrlab1;


  /*-------------------------------------------------------------.
  | yyerrlab1 -- common code for both syntax error and YYERROR.  |
  `-------------------------------------------------------------*/
  yyerrlab1:
    yyerrstatus_ = 3;   // Each real token shifted decrements this.
    // Pop stack until we find a state that shifts the error token.
    for (;;)
      {
        yyn = yypact_[+yystack_[0].state];
        if (!yy_pact_value_is_default_ (yyn))
          {
            yyn += symbol_kind::S_YYerror;
            if (0 <= yyn && yyn <= yylast_
                && yycheck_[yyn] == symbol_kind::S_YYerror)
              {
                yyn = yytable_[yyn];
                if (0 < yyn)
                  break;
              }
          }

        // Pop the current state because it cannot handle the error token.
        if (yystack_.size () == 1)
          YYABORT;

        yyerror_range[1].location = yystack_[0].location;
        yy_destroy_ ("Error: popping", yystack_[0]);
        yypop_ ();
        YY_STACK_PRINT ();
      }
    {
      stack_symbol_type error_token;

      yyerror_range[2].location = yyla.location;
      YYLLOC_DEFAULT (error_token.location, yyerror_range, 2);

      // Shift the error token.
      error_token.state = state_type (yyn);
      yypush_ ("Shifting", YY_MOVE (error_token));
    }
    goto yynewstate;


  /*-------------------------------------.
  | yyacceptlab -- YYACCEPT comes here.  |
  `-------------------------------------*/
  yyacceptlab:
    yyresult = 0;
    goto yyreturn;


  /*-----------------------------------.
  | yyabortlab -- YYABORT comes here.  |
  `-----------------------------------*/
  yyabortlab:
    yyresult = 1;
    goto yyreturn;


  /*-----------------------------------------------------.
  | yyreturn -- parsing is finished, return the result.  |
  `-----------------------------------------------------*/
  yyreturn:
    if (!yyla.empty ())
      yy_destroy_ ("Cleanup: discarding lookahead", yyla);

    /* Do not reclaim the symbols of the rule whose action triggered
       this YYABORT or YYACCEPT.  */
    yypop_ (yylen);
    YY_STACK_PRINT ();
    while (1 < yystack_.size ())
      {
        yy_destroy_ ("Cleanup: popping", yystack_[0]);
        yypop_ ();
      }

    return yyresult;
  }
#if YY_EXCEPTIONS
    catch (...)
      {
        YYCDEBUG << "Exception caught: cleaning lookahead and stack\n";
        // Do not try to display the values of the reclaimed symbols,
        // as their printers might throw an exception.
        if (!yyla.empty ())
          yy_destroy_ (YY_NULLPTR, yyla);

        while (1 < yystack_.size ())
          {
            yy_destroy_ (YY_NULLPTR, yystack_[0]);
            yypop_ ();
          }
        throw;
      }
#endif // YY_EXCEPTIONS
  }

  void
  parser::error (const syntax_error& yyexc)
  {
    error (yyexc.location, yyexc.what ());
  }

  /* Return YYSTR after stripping away unnecessary quotes and
     backslashes, so that it's suitable for yyerror.  The heuristic is
     that double-quoting is unnecessary unless the string contains an
     apostrophe, a comma, or backslash (other than backslash-backslash).
     YYSTR is taken from yytname.  */
  std::string
  parser::yytnamerr_ (const char *yystr)
  {
    if (*yystr == '"')
      {
        std::string yyr;
        char const *yyp = yystr;

        for (;;)
          switch (*++yyp)
            {
            case '\'':
            case ',':
              goto do_not_strip_quotes;

            case '\\':
              if (*++yyp != '\\')
                goto do_not_strip_quotes;
              else
                goto append;

            append:
            default:
              yyr += *yyp;
              break;

            case '"':
              return yyr;
            }
      do_not_strip_quotes: ;
      }

    return yystr;
  }

  std::string
  parser::symbol_name (symbol_kind_type yysymbol)
  {
    return yytnamerr_ (yytname_[yysymbol]);
  }



  // parser::context.
  parser::context::context (const parser& yyparser, const symbol_type& yyla)
    : yyparser_ (yyparser)
    , yyla_ (yyla)
  {}

  int
  parser::context::expected_tokens (symbol_kind_type yyarg[], int yyargn) const
  {
    // Actual number of expected tokens
    int yycount = 0;

    const int yyn = yypact_[+yyparser_.yystack_[0].state];
    if (!yy_pact_value_is_default_ (yyn))
      {
        /* Start YYX at -YYN if negative to avoid negative indexes in
           YYCHECK.  In other words, skip the first -YYN actions for
           this state because they are default actions.  */
        const int yyxbegin = yyn < 0 ? -yyn : 0;
        // Stay within bounds of both yycheck and yytname.
        const int yychecklim = yylast_ - yyn + 1;
        const int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
        for (int yyx = yyxbegin; yyx < yyxend; ++yyx)
          if (yycheck_[yyx + yyn] == yyx && yyx != symbol_kind::S_YYerror
              && !yy_table_value_is_error_ (yytable_[yyx + yyn]))
            {
              if (!yyarg)
                ++yycount;
              else if (yycount == yyargn)
                return 0;
              else
                yyarg[yycount++] = YY_CAST (symbol_kind_type, yyx);
            }
      }

    if (yyarg && yycount == 0 && 0 < yyargn)
      yyarg[0] = symbol_kind::S_YYEMPTY;
    return yycount;
  }






  int
  parser::yy_syntax_error_arguments_ (const context& yyctx,
                                                 symbol_kind_type yyarg[], int yyargn) const
  {
    /* There are many possibilities here to consider:
       - If this state is a consistent state with a default action, then
         the only way this function was invoked is if the default action
         is an error action.  In that case, don't check for expected
         tokens because there are none.
       - The only way there can be no lookahead present (in yyla) is
         if this state is a consistent state with a default action.
         Thus, detecting the absence of a lookahead is sufficient to
         determine that there is no unexpected or expected token to
         report.  In that case, just report a simple "syntax error".
       - Don't assume there isn't a lookahead just because this state is
         a consistent state with a default action.  There might have
         been a previous inconsistent state, consistent state with a
         non-default action, or user semantic action that manipulated
         yyla.  (However, yyla is currently not documented for users.)
       - Of course, the expected token list depends on states to have
         correct lookahead information, and it depends on the parser not
         to perform extra reductions after fetching a lookahead from the
         scanner and before detecting a syntax error.  Thus, state merging
         (from LALR or IELR) and default reductions corrupt the expected
         token list.  However, the list is correct for canonical LR with
         one exception: it will still contain any token that will not be
         accepted due to an error action in a later state.
    */

    if (!yyctx.lookahead ().empty ())
      {
        if (yyarg)
          yyarg[0] = yyctx.token ();
        int yyn = yyctx.expected_tokens (yyarg ? yyarg + 1 : yyarg, yyargn - 1);
        return yyn + 1;
      }
    return 0;
  }

  // Generate an error message.
  std::string
  parser::yysyntax_error_ (const context& yyctx) const
  {
    // Its maximum.
    enum { YYARGS_MAX = 5 };
    // Arguments of yyformat.
    symbol_kind_type yyarg[YYARGS_MAX];
    int yycount = yy_syntax_error_arguments_ (yyctx, yyarg, YYARGS_MAX);

    char const* yyformat = YY_NULLPTR;
    switch (yycount)
      {
#define YYCASE_(N, S)                         \
        case N:                               \
          yyformat = S;                       \
        break
      default: // Avoid compiler warnings.
        YYCASE_ (0, YY_("syntax error"));
        YYCASE_ (1, YY_("syntax error, unexpected %s"));
        YYCASE_ (2, YY_("syntax error, unexpected %s, expecting %s"));
        YYCASE_ (3, YY_("syntax error, unexpected %s, expecting %s or %s"));
        YYCASE_ (4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
        YYCASE_ (5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
#undef YYCASE_
      }

    std::string yyres;
    // Argument number.
    std::ptrdiff_t yyi = 0;
    for (char const* yyp = yyformat; *yyp; ++yyp)
      if (yyp[0] == '%' && yyp[1] == 's' && yyi < yycount)
        {
          yyres += symbol_name (yyarg[yyi++]);
          ++yyp;
        }
      else
        yyres += *yyp;
    return yyres;
  }


  const signed char parser::yypact_ninf_ = -50;

  const signed char parser::yytable_ninf_ = -6;

  const signed char
  parser::yypact_[] =
  {
       0,   -17,   -17,    16,     5,   -50,    25,   -50,   -50,   -50,
      42,   -50,    51,   -50,   -50,     0,    26,    30,   -50,   -50,
      26,    61,     4,    45,    52,    53,    72,    73,    35,   -50,
      81,    86,   -50,   -50,   -50,   100,   -50,    88,   -50,   -50,
      98,   -50,   -50,   -50,    83,    80,   -50,   -50,    84,     4,
      46,     4,     4,   -50,    -2,     4,     4,     4,     4,     4,
       4,    30,     4,   -50,     4,   -50,   100,    50,    95,   108,
     -50,   -50,    70,    91,   -50,   100,   -50,    57,    57,   -50,
     -50,   100,   100,    93,   -50,    90,   100,    -2,     4,     4,
     -50,   -50,     4,    92,     1,   -50,   100,    -2,    -8,   -50,
     105,    -2,   -50
  };

  const signed char
  parser::yydefact_[] =
  {
       3,     0,     0,     0,     0,     2,     0,     6,     7,     8,
       0,    10,     0,    12,     1,     3,    13,     0,     9,     4,
      13,     0,     0,     0,     0,     0,     0,     0,    48,    36,
       0,    15,    19,    20,    17,    21,    18,     0,    40,    37,
       0,    34,    14,    11,    48,     0,    28,    29,    43,     0,
       0,    50,     0,    38,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,     0,    42,     0,     0,     0,     0,
      26,    25,    52,     0,    51,    27,    16,    31,    30,    32,
      33,    46,    47,     0,    41,     0,    44,     0,     0,     0,
      49,    39,     0,    23,     0,    53,    45,     0,     0,    22,
       0,     0,    24
  };

  const signed char
  parser::yypgoto_[] =
  {
     -50,   -50,   101,   -50,   -50,   -50,   116,   -50,    99,   -43,
     -42,   -50,   -50,   -50,   -49,   -22,   109,   -50,   -44,   -50,
     -50,   -47,   -50,   -50,    31
  };

  const signed char
  parser::yydefgoto_[] =
  {
       0,     4,     5,     6,     7,     8,    11,     9,    21,    30,
      31,    32,    33,    69,    34,    35,    36,    37,    38,    65,
      39,    40,    41,    73,    74
  };

  const signed char
  parser::yytable_[] =
  {
      45,    70,    67,    -5,    98,    14,    71,    22,    23,    24,
      10,    76,    62,    22,    23,    24,    17,    84,    83,    68,
       1,     2,    26,     3,    27,    28,    29,    66,    15,    72,
      75,    44,    29,    77,    78,    79,    80,    81,    82,    22,
      85,    94,    86,    13,    51,    93,    23,    24,    17,   100,
      52,    16,    25,    20,    26,    99,    27,    28,    29,   102,
      87,    62,    23,    24,    57,    58,    66,    72,    25,    17,
      96,    43,    46,    68,    89,    55,    56,    57,    58,    47,
      48,    49,    50,    59,    60,    55,    56,    57,    58,    54,
      63,    61,    51,    59,    60,    55,    56,    57,    58,    64,
      53,    90,    92,    59,    60,    55,    56,    57,    58,    62,
      52,    88,    91,    59,    60,   101,    19,    97,    12,    42,
      95,    18
  };

  const signed char
  parser::yycheck_[] =
  {
      22,    50,    49,     3,     3,     0,    50,     9,    16,    17,
      27,    54,    11,     9,    16,    17,    18,    61,    61,    27,
      20,    21,    24,    23,    26,    27,    28,    49,     3,    51,
      52,    27,    28,    55,    56,    57,    58,    59,    60,     9,
      62,    88,    64,    27,     9,    87,    16,    17,    18,    98,
      15,     9,    22,    27,    24,    97,    26,    27,    28,   101,
      10,    11,    16,    17,     7,     8,    88,    89,    22,    18,
      92,    10,    27,    27,     4,     5,     6,     7,     8,    27,
      27,     9,     9,    13,    14,     5,     6,     7,     8,     3,
      10,     3,     9,    13,    14,     5,     6,     7,     8,    15,
      19,    10,    12,    13,    14,     5,     6,     7,     8,    11,
      15,     3,    19,    13,    14,    10,    15,    25,     2,    20,
      89,    12
  };

  const signed char
  parser::yystos_[] =
  {
       0,    20,    21,    23,    30,    31,    32,    33,    34,    36,
      27,    35,    35,    27,     0,     3,     9,    18,    45,    31,
      27,    37,     9,    16,    17,    22,    24,    26,    27,    28,
      38,    39,    40,    41,    43,    44,    45,    46,    47,    49,
      50,    51,    37,    10,    27,    44,    27,    27,    27,     9,
       9,     9,    15,    19,     3,     5,     6,     7,     8,    13,
      14,     3,    11,    10,    15,    48,    44,    50,    27,    42,
      43,    47,    44,    52,    53,    44,    38,    44,    44,    44,
      44,    44,    44,    38,    47,    44,    44,    10,     3,     4,
      10,    19,    12,    39,    50,    53,    44,    25,     3,    39,
      43,    10,    39
  };

  const signed char
  parser::yyr1_[] =
  {
       0,    29,    30,    31,    31,    32,    32,    32,    32,    33,
      34,    35,    36,    37,    37,    38,    38,    39,    39,    39,
      39,    39,    40,    40,    41,    42,    42,    43,    43,    43,
      44,    44,    44,    44,    44,    44,    44,    44,    45,    45,
      46,    46,    47,    48,    48,    49,    50,    50,    51,    51,
      52,    52,    53,    53
  };

  const signed char
  parser::yyr2_[] =
  {
       0,     2,     1,     0,     3,     0,     1,     1,     1,     3,
       2,     4,     2,     0,     2,     1,     3,     1,     1,     1,
       1,     1,     7,     5,     9,     1,     1,     3,     2,     2,
       3,     3,     3,     3,     1,     3,     1,     1,     3,     5,
       1,     3,     3,     0,     2,     5,     3,     3,     1,     4,
       0,     1,     1,     3
  };


#if YYDEBUG || 1
  // YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
  // First, the terminals, then, starting at \a YYNTOKENS, nonterminals.
  const char*
  const parser::yytname_[] =
  {
  "\"end of file\"", "error", "\"invalid token\"", "\";\"", "\",\"",
  "\"-\"", "\"+\"", "\"*\"", "\"/\"", "\"(\"", "\")\"", "\"?\"", "\":\"",
  "\"<\"", "\"==\"", "\"=\"", "\"++\"", "\"--\"", "\"{\"", "\"}\"",
  "\"extern\"", "\"def\"", "\"var\"", "\"global\"", "\"if\"", "\"else\"",
  "\"for\"", "\"id\"", "\"number\"", "$accept", "startsymb", "program",
  "top", "definition", "external", "proto", "globalvar", "idseq", "stmts",
  "stmt", "ifstmt", "forstmt", "init", "assignment", "exp", "block",
  "vardefs", "binding", "initexp", "expif", "condexp", "idexp", "optexp",
  "explist", YY_NULLPTR
  };
#endif


#if YYDEBUG
  const unsigned char
  parser::yyrline_[] =
  {
       0,   103,   103,   106,   107,   110,   111,   112,   113,   116,
     119,   122,   125,   128,   130,   133,   136,   140,   141,   142,
     143,   144,   147,   148,   151,   154,   156,   160,   161,   165,
     176,   177,   178,   179,   180,   181,   182,   183,   186,   188,
     191,   194,   198,   201,   202,   205,   208,   209,   212,   213,
     216,   218,   221,   225
  };

  void
  parser::yy_stack_print_ () const
  {
    *yycdebug_ << "Stack now";
    for (stack_type::const_iterator
           i = yystack_.begin (),
           i_end = yystack_.end ();
         i != i_end; ++i)
      *yycdebug_ << ' ' << int (i->state);
    *yycdebug_ << '\n';
  }

  void
  parser::yy_reduce_print_ (int yyrule) const
  {
    int yylno = yyrline_[yyrule];
    int yynrhs = yyr2_[yyrule];
    // Print the symbols being reduced, and their result.
    *yycdebug_ << "Reducing stack by rule " << yyrule - 1
               << " (line " << yylno << "):\n";
    // The symbols being reduced.
    for (int yyi = 0; yyi < yynrhs; yyi++)
      YY_SYMBOL_PRINT ("   $" << yyi + 1 << " =",
                       yystack_[(yynrhs) - (yyi + 1)]);
  }
#endif // YYDEBUG


} // yy
#line 1770 "parser.cpp"

#line 227 "parser.yy"


void
yy::parser::error (const location_type& l, const std::string& m)
{
  std::cerr << l << ": " << m << '\n';
}
