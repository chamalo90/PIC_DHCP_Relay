/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison implementation for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.5"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */

/* Line 268 of yacc.c  */
#line 24 "SDCC.y"

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include "SDCCglobl.h"
#include "SDCCsymt.h"
#include "SDCChasht.h"
#include "SDCCval.h"
#include "SDCCmem.h"
#include "SDCCast.h"
#include "port.h"
#include "newalloc.h"
#include "SDCCerr.h"
#include "SDCCutil.h"

extern int yyerror (char *);
extern FILE     *yyin;
int NestLevel = 0 ;     /* current NestLevel       */
int stackPtr  = 1 ;     /* stack pointer           */
int xstackPtr = 0 ;     /* xstack pointer          */
int reentrant = 0 ;
int blockNo   = 0 ;     /* sequential block number  */
int currBlockno=0 ;
int inCritical= 0 ;
int seqPointNo= 1 ;     /* sequence point number */
int ignoreTypedefType=0;
extern int yylex();
int yyparse(void);
extern int noLineno ;
char lbuff[1024];      /* local buffer */

/* break & continue stacks */
STACK_DCL(continueStack  ,symbol *,MAX_NEST_LEVEL)
STACK_DCL(breakStack  ,symbol *,MAX_NEST_LEVEL)
STACK_DCL(forStack  ,symbol *,MAX_NEST_LEVEL)
STACK_DCL(swStk   ,ast   *,MAX_NEST_LEVEL)
STACK_DCL(blockNum,int,MAX_NEST_LEVEL*3)

value *cenum = NULL  ;  /* current enumeration  type chain*/
bool uselessDecl = TRUE;

#define YYDEBUG 1



/* Line 268 of yacc.c  */
#line 117 "SDCCy.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IDENTIFIER = 258,
     TYPE_NAME = 259,
     CONSTANT = 260,
     STRING_LITERAL = 261,
     SIZEOF = 262,
     TYPEOF = 263,
     PTR_OP = 264,
     INC_OP = 265,
     DEC_OP = 266,
     LEFT_OP = 267,
     RIGHT_OP = 268,
     LE_OP = 269,
     GE_OP = 270,
     EQ_OP = 271,
     NE_OP = 272,
     AND_OP = 273,
     OR_OP = 274,
     MUL_ASSIGN = 275,
     DIV_ASSIGN = 276,
     MOD_ASSIGN = 277,
     ADD_ASSIGN = 278,
     SUB_ASSIGN = 279,
     LEFT_ASSIGN = 280,
     RIGHT_ASSIGN = 281,
     AND_ASSIGN = 282,
     XOR_ASSIGN = 283,
     OR_ASSIGN = 284,
     TYPEDEF = 285,
     EXTERN = 286,
     STATIC = 287,
     AUTO = 288,
     REGISTER = 289,
     CODE = 290,
     EEPROM = 291,
     INTERRUPT = 292,
     SFR = 293,
     SFR16 = 294,
     SFR32 = 295,
     AT = 296,
     SBIT = 297,
     REENTRANT = 298,
     USING = 299,
     XDATA = 300,
     DATA = 301,
     IDATA = 302,
     PDATA = 303,
     VAR_ARGS = 304,
     CRITICAL = 305,
     NONBANKED = 306,
     BANKED = 307,
     SHADOWREGS = 308,
     WPARAM = 309,
     CHAR = 310,
     SHORT = 311,
     INT = 312,
     LONG = 313,
     SIGNED = 314,
     UNSIGNED = 315,
     FLOAT = 316,
     DOUBLE = 317,
     FIXED16X16 = 318,
     CONST = 319,
     VOLATILE = 320,
     VOID = 321,
     BIT = 322,
     STRUCT = 323,
     UNION = 324,
     ENUM = 325,
     RANGE = 326,
     FAR = 327,
     CASE = 328,
     DEFAULT = 329,
     IF = 330,
     ELSE = 331,
     SWITCH = 332,
     WHILE = 333,
     DO = 334,
     FOR = 335,
     GOTO = 336,
     CONTINUE = 337,
     BREAK = 338,
     RETURN = 339,
     NAKED = 340,
     JAVANATIVE = 341,
     OVERLAY = 342,
     INLINEASM = 343,
     IFX = 344,
     ADDRESS_OF = 345,
     GET_VALUE_AT_ADDRESS = 346,
     SPIL = 347,
     UNSPIL = 348,
     GETHBIT = 349,
     GETABIT = 350,
     GETBYTE = 351,
     GETWORD = 352,
     BITWISEAND = 353,
     UNARYMINUS = 354,
     IPUSH = 355,
     IPOP = 356,
     PCALL = 357,
     ENDFUNCTION = 358,
     JUMPTABLE = 359,
     RRC = 360,
     RLC = 361,
     CAST = 362,
     CALL = 363,
     PARAM = 364,
     NULLOP = 365,
     BLOCK = 366,
     LABEL = 367,
     RECEIVE = 368,
     SEND = 369,
     ARRAYINIT = 370,
     DUMMY_READ_VOLATILE = 371,
     ENDCRITICAL = 372,
     SWAP = 373,
     INLINE = 374,
     RESTRICT = 375
   };
#endif
/* Tokens.  */
#define IDENTIFIER 258
#define TYPE_NAME 259
#define CONSTANT 260
#define STRING_LITERAL 261
#define SIZEOF 262
#define TYPEOF 263
#define PTR_OP 264
#define INC_OP 265
#define DEC_OP 266
#define LEFT_OP 267
#define RIGHT_OP 268
#define LE_OP 269
#define GE_OP 270
#define EQ_OP 271
#define NE_OP 272
#define AND_OP 273
#define OR_OP 274
#define MUL_ASSIGN 275
#define DIV_ASSIGN 276
#define MOD_ASSIGN 277
#define ADD_ASSIGN 278
#define SUB_ASSIGN 279
#define LEFT_ASSIGN 280
#define RIGHT_ASSIGN 281
#define AND_ASSIGN 282
#define XOR_ASSIGN 283
#define OR_ASSIGN 284
#define TYPEDEF 285
#define EXTERN 286
#define STATIC 287
#define AUTO 288
#define REGISTER 289
#define CODE 290
#define EEPROM 291
#define INTERRUPT 292
#define SFR 293
#define SFR16 294
#define SFR32 295
#define AT 296
#define SBIT 297
#define REENTRANT 298
#define USING 299
#define XDATA 300
#define DATA 301
#define IDATA 302
#define PDATA 303
#define VAR_ARGS 304
#define CRITICAL 305
#define NONBANKED 306
#define BANKED 307
#define SHADOWREGS 308
#define WPARAM 309
#define CHAR 310
#define SHORT 311
#define INT 312
#define LONG 313
#define SIGNED 314
#define UNSIGNED 315
#define FLOAT 316
#define DOUBLE 317
#define FIXED16X16 318
#define CONST 319
#define VOLATILE 320
#define VOID 321
#define BIT 322
#define STRUCT 323
#define UNION 324
#define ENUM 325
#define RANGE 326
#define FAR 327
#define CASE 328
#define DEFAULT 329
#define IF 330
#define ELSE 331
#define SWITCH 332
#define WHILE 333
#define DO 334
#define FOR 335
#define GOTO 336
#define CONTINUE 337
#define BREAK 338
#define RETURN 339
#define NAKED 340
#define JAVANATIVE 341
#define OVERLAY 342
#define INLINEASM 343
#define IFX 344
#define ADDRESS_OF 345
#define GET_VALUE_AT_ADDRESS 346
#define SPIL 347
#define UNSPIL 348
#define GETHBIT 349
#define GETABIT 350
#define GETBYTE 351
#define GETWORD 352
#define BITWISEAND 353
#define UNARYMINUS 354
#define IPUSH 355
#define IPOP 356
#define PCALL 357
#define ENDFUNCTION 358
#define JUMPTABLE 359
#define RRC 360
#define RLC 361
#define CAST 362
#define CALL 363
#define PARAM 364
#define NULLOP 365
#define BLOCK 366
#define LABEL 367
#define RECEIVE 368
#define SEND 369
#define ARRAYINIT 370
#define DUMMY_READ_VOLATILE 371
#define ENDCRITICAL 372
#define SWAP 373
#define INLINE 374
#define RESTRICT 375




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 293 of yacc.c  */
#line 70 "SDCC.y"

    symbol     *sym ;      /* symbol table pointer       */
    structdef  *sdef;      /* structure definition       */
    char       yychar[SDCC_NAME_MAX+1];
    sym_link   *lnk ;      /* declarator  or specifier   */
    int        yyint;      /* integer value returned     */
    value      *val ;      /* for integer constant       */
    initList   *ilist;     /* initial list               */
    const char *yyinline;  /* inlined assembler code     */
    ast        *asts;      /* expression tree            */



/* Line 293 of yacc.c  */
#line 407 "SDCCy.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 343 of yacc.c  */
#line 419 "SDCCy.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  68
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   1516

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  145
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  105
/* YYNRULES -- Number of rules.  */
#define YYNRULES  284
/* YYNRULES -- Number of states.  */
#define YYNSTATES  422

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   375

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   132,     2,     2,     2,   134,   127,     2,
     121,   122,   128,   129,   126,   130,   125,   133,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   140,   142,
     135,   141,   136,   139,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   123,     2,   124,   137,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   143,   138,   144,   131,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     4,     6,     8,    11,    13,    15,    18,
      22,    24,    27,    30,    32,    34,    36,    38,    40,    42,
      44,    46,    48,    50,    52,    55,    57,    59,    61,    65,
      67,    69,    74,    78,    83,    84,    89,    90,    95,    98,
     101,   103,   107,   109,   112,   115,   118,   121,   126,   129,
     131,   133,   135,   137,   139,   141,   143,   148,   150,   154,
     158,   162,   164,   168,   172,   174,   178,   182,   184,   188,
     192,   196,   200,   202,   206,   210,   212,   216,   218,   222,
     224,   228,   230,   231,   236,   238,   239,   244,   246,   247,
     254,   256,   260,   262,   264,   266,   268,   270,   272,   274,
     276,   278,   280,   282,   284,   285,   290,   292,   295,   299,
     301,   303,   306,   308,   311,   313,   316,   318,   322,   324,
     328,   330,   332,   334,   336,   338,   340,   342,   345,   347,
     351,   353,   355,   357,   359,   361,   363,   365,   367,   369,
     371,   373,   375,   377,   379,   381,   383,   385,   387,   389,
     391,   393,   395,   397,   399,   401,   403,   406,   408,   410,
     411,   418,   421,   423,   425,   427,   428,   430,   432,   435,
     439,   441,   445,   447,   450,   454,   455,   460,   466,   469,
     471,   474,   478,   481,   484,   485,   487,   490,   492,   494,
     496,   499,   501,   504,   506,   510,   514,   519,   523,   524,
     530,   535,   537,   540,   543,   547,   549,   551,   553,   556,
     558,   562,   564,   568,   570,   574,   577,   579,   581,   584,
     586,   588,   591,   595,   598,   602,   606,   611,   614,   618,
     622,   623,   629,   631,   635,   640,   642,   646,   648,   650,
     652,   654,   656,   658,   660,   663,   665,   668,   671,   675,
     676,   680,   682,   684,   687,   691,   695,   700,   703,   705,
     708,   710,   713,   715,   718,   721,   722,   723,   731,   732,
     739,   741,   743,   745,   746,   753,   761,   771,   772,   774,
     778,   781,   784,   787,   791
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     146,     0,    -1,    -1,   147,    -1,   148,    -1,   147,   148,
      -1,   149,    -1,   181,    -1,   208,   152,    -1,   182,   208,
     152,    -1,   151,    -1,   151,   150,    -1,    44,   180,    -1,
      43,    -1,    50,    -1,    85,    -1,    86,    -1,    87,    -1,
      51,    -1,    53,    -1,    54,    -1,    52,    -1,   188,    -1,
     234,    -1,   235,   234,    -1,   249,    -1,     5,    -1,   154,
      -1,   121,   178,   122,    -1,     6,    -1,   153,    -1,   155,
     123,   178,   124,    -1,   155,   121,   122,    -1,   155,   121,
     158,   122,    -1,    -1,   155,   125,   156,   249,    -1,    -1,
     155,     9,   157,   249,    -1,   155,    10,    -1,   155,    11,
      -1,   176,    -1,   176,   126,   158,    -1,   155,    -1,    10,
     159,    -1,    11,   159,    -1,   160,   161,    -1,     7,   159,
      -1,     7,   121,   221,   122,    -1,     8,   159,    -1,   127,
      -1,   128,    -1,   129,    -1,   130,    -1,   131,    -1,   132,
      -1,   159,    -1,   121,   221,   122,   161,    -1,   161,    -1,
     162,   128,   161,    -1,   162,   133,   161,    -1,   162,   134,
     161,    -1,   162,    -1,   163,   129,   162,    -1,   163,   130,
     162,    -1,   163,    -1,   164,    12,   163,    -1,   164,    13,
     163,    -1,   164,    -1,   165,   135,   164,    -1,   165,   136,
     164,    -1,   165,    14,   164,    -1,   165,    15,   164,    -1,
     165,    -1,   166,    16,   165,    -1,   166,    17,   165,    -1,
     166,    -1,   167,   127,   166,    -1,   167,    -1,   168,   137,
     167,    -1,   168,    -1,   169,   138,   168,    -1,   169,    -1,
      -1,   170,    18,   171,   169,    -1,   170,    -1,    -1,   172,
      19,   173,   170,    -1,   172,    -1,    -1,   172,   139,   175,
     172,   140,   174,    -1,   174,    -1,   161,   177,   176,    -1,
     141,    -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,
      24,    -1,    25,    -1,    26,    -1,    27,    -1,    28,    -1,
      29,    -1,   176,    -1,    -1,   178,   126,   179,   176,    -1,
     174,    -1,   182,   142,    -1,   182,   184,   142,    -1,   183,
      -1,   186,    -1,   186,   183,    -1,   189,    -1,   189,   183,
      -1,   187,    -1,   187,   183,    -1,   185,    -1,   184,   126,
     185,    -1,   206,    -1,   206,   141,   225,    -1,    30,    -1,
      31,    -1,    32,    -1,    33,    -1,    34,    -1,   119,    -1,
      37,    -1,    37,   180,    -1,   190,    -1,   190,    41,   180,
      -1,    55,    -1,    56,    -1,    57,    -1,    58,    -1,    59,
      -1,    60,    -1,    66,    -1,    64,    -1,    65,    -1,   120,
      -1,    61,    -1,    63,    -1,    45,    -1,    35,    -1,    36,
      -1,    46,    -1,    47,    -1,    48,    -1,    67,    -1,   193,
      -1,   202,    -1,     4,    -1,   191,    -1,    42,    -1,   192,
      -1,    38,    -1,    38,    52,    -1,    39,    -1,    40,    -1,
      -1,   195,   196,   194,   143,   198,   144,    -1,   195,   197,
      -1,    68,    -1,    69,    -1,   197,    -1,    -1,   249,    -1,
     199,    -1,   198,   199,    -1,   215,   200,   142,    -1,   201,
      -1,   200,   126,   201,    -1,   206,    -1,   140,   180,    -1,
     206,   140,   180,    -1,    -1,    70,   143,   203,   144,    -1,
      70,   249,   143,   203,   144,    -1,    70,   249,    -1,   204,
      -1,   203,   126,    -1,   203,   126,   204,    -1,   249,   205,
      -1,   141,   180,    -1,    -1,   207,    -1,   213,   207,    -1,
     209,    -1,   210,    -1,   209,    -1,   213,   209,    -1,   211,
      -1,   211,   150,    -1,   249,    -1,   121,   206,   122,    -1,
     207,   123,   124,    -1,   207,   123,   180,   124,    -1,   210,
     121,   122,    -1,    -1,   210,   121,   212,   218,   122,    -1,
     210,   121,   217,   122,    -1,   214,    -1,   214,   215,    -1,
     214,   213,    -1,   214,   215,   213,    -1,   128,    -1,   216,
      -1,   189,    -1,   216,   189,    -1,   249,    -1,   217,   126,
     249,    -1,   219,    -1,   219,   126,    49,    -1,   220,    -1,
     219,   126,   220,    -1,   215,   206,    -1,   221,    -1,   215,
      -1,   215,   222,    -1,   213,    -1,   223,    -1,   213,   223,
      -1,   121,   222,   122,    -1,   123,   124,    -1,   123,   180,
     124,    -1,   223,   123,   124,    -1,   223,   123,   180,   124,
      -1,   121,   122,    -1,   121,   218,   122,    -1,   223,   121,
     122,    -1,    -1,   223,   121,   224,   218,   122,    -1,   176,
      -1,   143,   226,   144,    -1,   143,   226,   126,   144,    -1,
     225,    -1,   226,   126,   225,    -1,   230,    -1,   234,    -1,
     237,    -1,   239,    -1,   245,    -1,   248,    -1,   229,    -1,
      88,   142,    -1,    50,    -1,   228,   227,    -1,   249,   140,
      -1,    73,   180,   140,    -1,    -1,    74,   231,   140,    -1,
     143,    -1,   144,    -1,   232,   233,    -1,   232,   236,   233,
      -1,   232,   235,   233,    -1,   232,   235,   236,   233,    -1,
       1,   142,    -1,   181,    -1,   235,   181,    -1,   227,    -1,
     236,   227,    -1,   142,    -1,   178,   142,    -1,    76,   227,
      -1,    -1,    -1,    75,   121,   178,   122,   240,   227,   238,
      -1,    -1,    77,   121,   178,   122,   241,   227,    -1,    78,
      -1,    79,    -1,    80,    -1,    -1,   242,   121,   178,   122,
     246,   227,    -1,   243,   227,    78,   121,   178,   122,   142,
      -1,   244,   121,   247,   142,   247,   142,   247,   122,   227,
      -1,    -1,   178,    -1,    81,   249,   142,    -1,    82,   142,
      -1,    83,   142,    -1,    84,   142,    -1,    84,   178,   142,
      -1,     3,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   137,   137,   140,   144,   145,   149,   152,   178,   183,
     192,   193,   197,   201,   204,   207,   210,   213,   216,   222,
     225,   228,   237,   246,   247,   255,   256,   257,   258,   262,
     266,   267,   268,   270,   274,   274,   281,   281,   288,   290,
     295,   296,   300,   301,   302,   303,   304,   305,   306,   310,
     311,   312,   313,   314,   315,   319,   320,   324,   325,   326,
     327,   331,   332,   333,   337,   338,   339,   343,   344,   345,
     346,   347,   351,   352,   353,   357,   358,   362,   363,   367,
     368,   372,   373,   373,   378,   379,   379,   384,   385,   385,
     393,   394,   439,   440,   441,   442,   443,   444,   445,   446,
     447,   448,   449,   453,   454,   454,   458,   462,   469,   486,
     489,   490,   495,   496,   501,   502,   510,   511,   515,   516,
     521,   525,   529,   533,   537,   544,   551,   552,   565,   566,
     576,   581,   586,   591,   596,   601,   606,   611,   615,   619,
     623,   628,   633,   637,   641,   645,   649,   653,   657,   666,
     671,   677,   686,   690,   698,   702,   710,   721,   732,   745,
     744,   793,   812,   813,   817,   818,   825,   836,   837,   850,
     876,   877,   885,   886,   899,   915,   920,   925,   945,   959,
     960,   961,   969,   992,  1005,  1018,  1019,  1027,  1028,  1032,
    1033,  1041,  1042,  1074,  1075,  1076,  1085,  1117,  1118,  1118,
    1144,  1154,  1155,  1167,  1173,  1212,  1219,  1222,  1224,  1232,
    1233,  1241,  1242,  1246,  1247,  1255,  1265,  1274,  1275,  1292,
    1293,  1294,  1301,  1302,  1307,  1313,  1319,  1327,  1328,  1329,
    1341,  1341,  1365,  1366,  1367,  1371,  1372,  1376,  1377,  1378,
    1379,  1380,  1381,  1382,  1383,  1394,  1403,  1413,  1415,  1422,
    1422,  1431,  1439,  1443,  1444,  1445,  1446,  1449,  1453,  1466,
    1492,  1493,  1497,  1498,  1502,  1503,  1508,  1508,  1516,  1516,
    1541,  1555,  1570,  1589,  1589,  1598,  1608,  1636,  1637,  1641,
    1646,  1659,  1669,  1678,  1690
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "IDENTIFIER", "TYPE_NAME", "CONSTANT",
  "STRING_LITERAL", "SIZEOF", "TYPEOF", "PTR_OP", "INC_OP", "DEC_OP",
  "LEFT_OP", "RIGHT_OP", "LE_OP", "GE_OP", "EQ_OP", "NE_OP", "AND_OP",
  "OR_OP", "MUL_ASSIGN", "DIV_ASSIGN", "MOD_ASSIGN", "ADD_ASSIGN",
  "SUB_ASSIGN", "LEFT_ASSIGN", "RIGHT_ASSIGN", "AND_ASSIGN", "XOR_ASSIGN",
  "OR_ASSIGN", "TYPEDEF", "EXTERN", "STATIC", "AUTO", "REGISTER", "CODE",
  "EEPROM", "INTERRUPT", "SFR", "SFR16", "SFR32", "AT", "SBIT",
  "REENTRANT", "USING", "XDATA", "DATA", "IDATA", "PDATA", "VAR_ARGS",
  "CRITICAL", "NONBANKED", "BANKED", "SHADOWREGS", "WPARAM", "CHAR",
  "SHORT", "INT", "LONG", "SIGNED", "UNSIGNED", "FLOAT", "DOUBLE",
  "FIXED16X16", "CONST", "VOLATILE", "VOID", "BIT", "STRUCT", "UNION",
  "ENUM", "RANGE", "FAR", "CASE", "DEFAULT", "IF", "ELSE", "SWITCH",
  "WHILE", "DO", "FOR", "GOTO", "CONTINUE", "BREAK", "RETURN", "NAKED",
  "JAVANATIVE", "OVERLAY", "INLINEASM", "IFX", "ADDRESS_OF",
  "GET_VALUE_AT_ADDRESS", "SPIL", "UNSPIL", "GETHBIT", "GETABIT",
  "GETBYTE", "GETWORD", "BITWISEAND", "UNARYMINUS", "IPUSH", "IPOP",
  "PCALL", "ENDFUNCTION", "JUMPTABLE", "RRC", "RLC", "CAST", "CALL",
  "PARAM", "NULLOP", "BLOCK", "LABEL", "RECEIVE", "SEND", "ARRAYINIT",
  "DUMMY_READ_VOLATILE", "ENDCRITICAL", "SWAP", "INLINE", "RESTRICT",
  "'('", "')'", "'['", "']'", "'.'", "','", "'&'", "'*'", "'+'", "'-'",
  "'~'", "'!'", "'/'", "'%'", "'<'", "'>'", "'^'", "'|'", "'?'", "':'",
  "'='", "';'", "'{'", "'}'", "$accept", "file", "program",
  "external_definition", "function_definition", "function_attribute",
  "function_attributes", "function_body", "primary_expr", "string_literal",
  "postfix_expr", "$@1", "$@2", "argument_expr_list", "unary_expr",
  "unary_operator", "cast_expr", "multiplicative_expr", "additive_expr",
  "shift_expr", "relational_expr", "equality_expr", "and_expr",
  "exclusive_or_expr", "inclusive_or_expr", "logical_and_expr", "$@3",
  "logical_or_expr", "$@4", "conditional_expr", "$@5", "assignment_expr",
  "assignment_operator", "expr", "$@6", "constant_expr", "declaration",
  "declaration_specifiers", "declaration_specifiers_",
  "init_declarator_list", "init_declarator", "storage_class_specifier",
  "function_specifier", "Interrupt_storage", "type_specifier",
  "type_specifier2", "sfr_reg_bit", "sfr_attributes",
  "struct_or_union_specifier", "$@7", "struct_or_union", "opt_stag",
  "stag", "struct_declaration_list", "struct_declaration",
  "struct_declarator_list", "struct_declarator", "enum_specifier",
  "enumerator_list", "enumerator", "opt_assign_expr", "declarator",
  "declarator3", "function_declarator", "declarator2_function_attributes",
  "declarator2", "function_declarator2", "$@8", "pointer",
  "unqualified_pointer", "type_specifier_list", "type_specifier_list_",
  "identifier_list", "parameter_type_list", "parameter_list",
  "parameter_declaration", "type_name", "abstract_declarator",
  "abstract_declarator2", "$@9", "initializer", "initializer_list",
  "statement", "critical", "critical_statement", "labeled_statement",
  "@10", "start_block", "end_block", "compound_statement",
  "declaration_list", "statement_list", "expression_statement",
  "else_statement", "selection_statement", "$@11", "@12", "while", "do",
  "for", "iteration_statement", "$@13", "expr_opt", "jump_statement",
  "identifier", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,    40,    41,    91,    93,    46,    44,    38,    42,    43,
      45,   126,    33,    47,    37,    60,    62,    94,   124,    63,
      58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   145,   146,   146,   147,   147,   148,   148,   149,   149,
     150,   150,   151,   151,   151,   151,   151,   151,   151,   151,
     151,   151,   151,   152,   152,   153,   153,   153,   153,   154,
     155,   155,   155,   155,   156,   155,   157,   155,   155,   155,
     158,   158,   159,   159,   159,   159,   159,   159,   159,   160,
     160,   160,   160,   160,   160,   161,   161,   162,   162,   162,
     162,   163,   163,   163,   164,   164,   164,   165,   165,   165,
     165,   165,   166,   166,   166,   167,   167,   168,   168,   169,
     169,   170,   171,   170,   172,   173,   172,   174,   175,   174,
     176,   176,   177,   177,   177,   177,   177,   177,   177,   177,
     177,   177,   177,   178,   179,   178,   180,   181,   181,   182,
     183,   183,   183,   183,   183,   183,   184,   184,   185,   185,
     186,   186,   186,   186,   186,   187,   188,   188,   189,   189,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     190,   190,   190,   191,   191,   192,   192,   192,   192,   194,
     193,   193,   195,   195,   196,   196,   197,   198,   198,   199,
     200,   200,   201,   201,   201,   201,   202,   202,   202,   203,
     203,   203,   204,   205,   205,   206,   206,   207,   207,   208,
     208,   209,   209,   210,   210,   210,   210,   211,   212,   211,
     211,   213,   213,   213,   213,   214,   215,   216,   216,   217,
     217,   218,   218,   219,   219,   220,   220,   221,   221,   222,
     222,   222,   223,   223,   223,   223,   223,   223,   223,   223,
     224,   223,   225,   225,   225,   226,   226,   227,   227,   227,
     227,   227,   227,   227,   227,   228,   229,   230,   230,   231,
     230,   232,   233,   234,   234,   234,   234,   234,   235,   235,
     236,   236,   237,   237,   238,   238,   240,   239,   241,   239,
     242,   243,   244,   246,   245,   245,   245,   247,   247,   248,
     248,   248,   248,   248,   249
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     1,     1,     2,     1,     1,     2,     3,
       1,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     2,     1,     1,     1,     3,     1,
       1,     4,     3,     4,     0,     4,     0,     4,     2,     2,
       1,     3,     1,     2,     2,     2,     2,     4,     2,     1,
       1,     1,     1,     1,     1,     1,     4,     1,     3,     3,
       3,     1,     3,     3,     1,     3,     3,     1,     3,     3,
       3,     3,     1,     3,     3,     1,     3,     1,     3,     1,
       3,     1,     0,     4,     1,     0,     4,     1,     0,     6,
       1,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     0,     4,     1,     2,     3,     1,
       1,     2,     1,     2,     1,     2,     1,     3,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     2,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     2,     1,     1,     0,
       6,     2,     1,     1,     1,     0,     1,     1,     2,     3,
       1,     3,     1,     2,     3,     0,     4,     5,     2,     1,
       2,     3,     2,     2,     0,     1,     2,     1,     1,     1,
       2,     1,     2,     1,     3,     3,     4,     3,     0,     5,
       4,     1,     2,     2,     3,     1,     1,     1,     2,     1,
       3,     1,     3,     1,     3,     2,     1,     1,     2,     1,
       1,     2,     3,     2,     3,     3,     4,     2,     3,     3,
       0,     5,     1,     3,     4,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     2,     1,     2,     2,     3,     0,
       3,     1,     1,     2,     3,     3,     4,     2,     1,     2,
       1,     2,     1,     2,     2,     0,     0,     7,     0,     6,
       1,     1,     1,     0,     6,     7,     9,     0,     1,     3,
       2,     2,     2,     3,     1
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       2,   284,   151,   120,   121,   122,   123,   124,   143,   144,
     155,   157,   158,   153,   142,   145,   146,   147,   130,   131,
     132,   133,   134,   135,   140,   141,   137,   138,   136,   148,
     162,   163,     0,   125,   139,     0,   205,     0,     3,     4,
       6,     7,     0,   109,   110,   114,   112,   128,   152,   154,
     149,   165,   150,     0,     0,   189,   188,   191,     0,   201,
     193,   156,     0,   178,     0,   185,   187,     0,     1,     5,
     107,     0,   116,   118,     0,     0,   111,   115,   113,     0,
     159,   161,   166,     0,     0,   251,     8,   258,     0,     0,
      23,     0,   198,   126,    13,     0,    14,    18,    21,    19,
      20,    15,    16,    17,   192,    10,    22,   190,   207,   203,
     202,   206,     0,   179,   184,     0,   194,   186,     0,   108,
       0,     9,    26,    29,     0,     0,     0,     0,     0,    49,
      50,    51,    52,    53,    54,    30,    27,    42,    55,     0,
      57,    61,    64,    67,    72,    75,    77,    79,    81,    84,
      87,   106,   129,    25,     0,   195,     0,   257,   245,     0,
     249,     0,     0,   270,   271,   272,     0,     0,     0,     0,
       0,   262,   252,    57,    90,   103,     0,   260,     0,   243,
     237,   253,   238,     0,     0,   239,   240,     0,     0,     0,
     241,   242,    25,   259,    24,   197,     0,     0,   209,   127,
      12,    11,   204,   208,   180,   176,     0,   182,     0,   117,
       0,   232,   119,     0,    46,     0,    48,    43,    44,     0,
     217,     0,    36,    38,    39,     0,     0,    34,    45,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,    85,    88,     0,   196,
       0,     0,     0,     0,     0,   280,   281,   282,     0,   244,
      93,    94,    95,    96,    97,    98,    99,   100,   101,   102,
      92,     0,   104,   263,   246,   255,     0,   261,   254,     0,
       0,   277,   247,   217,     0,   211,   213,   216,   200,     0,
     181,   183,   177,   235,     0,     0,    28,     0,     0,   219,
     218,   220,     0,     0,    32,     0,    40,     0,     0,    58,
      59,    60,    62,    63,    65,    66,    70,    71,    68,    69,
      73,    74,    76,    78,    80,     0,     0,     0,     0,   167,
     175,   248,   250,     0,     0,   279,   283,    91,     0,   256,
       0,     0,   278,     0,     0,   215,   219,   199,     0,   210,
       0,   233,    47,   227,     0,     0,   223,     0,   221,   230,
       0,    56,    37,    33,     0,    31,    35,    83,    86,     0,
     160,   168,     0,     0,   170,   172,   266,   268,   105,   273,
       0,   277,   212,   214,   234,   236,   228,   222,   224,   229,
       0,   225,     0,    41,     0,   173,   175,   169,     0,     0,
       0,     0,     0,     0,     0,   226,    89,   171,   174,   265,
     269,   274,     0,   277,   231,     0,   267,   275,     0,   264,
       0,   276
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    37,    38,    39,    40,   104,   105,    86,   135,   136,
     137,   308,   303,   305,   138,   139,   173,   141,   142,   143,
     144,   145,   146,   147,   148,   149,   325,   150,   326,   174,
     327,   175,   271,   176,   338,   152,    87,    88,    43,    71,
      72,    44,    45,   106,    46,    47,    48,    49,    50,   154,
      51,    80,    81,   328,   329,   373,   374,    52,   112,   113,
     207,    73,    65,    54,    66,    56,    57,   196,    67,    59,
     283,   111,   197,   354,   285,   286,   287,   300,   301,   390,
     212,   294,   177,   178,   179,   180,   251,    89,   181,   182,
      91,   184,   185,   416,   186,   399,   400,   187,   188,   189,
     190,   401,   343,   191,   153
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -360
static const yytype_int16 yypact[] =
{
    1028,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
      16,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,     8,  -360,  -360,    28,  -360,    44,  1028,  -360,
    -360,  -360,    13,  -360,  1310,  1310,  1310,    20,  -360,  -360,
    -360,    84,  -360,   -30,   679,   -32,   -20,   354,    38,  1265,
    -360,  -360,    84,   -22,    52,   -30,  -360,    38,  -360,  -360,
    -360,   -69,  -360,   -17,   679,    38,  -360,  -360,  -360,   992,
    -360,    55,  -360,   228,    60,  -360,  -360,  -360,    13,   480,
    -360,   679,    25,   992,  -360,   992,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,   354,  -360,   -32,  -360,  -360,
      73,  1396,   -73,  -360,    62,    84,  -360,   -30,    28,  -360,
     767,  -360,  -360,  -360,  1004,  1039,  1039,  1039,   897,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,    54,  -360,   992,
    -360,    -8,     9,   158,    32,   170,    86,    80,    82,   201,
      -6,  -360,  -360,  -360,    78,  -360,    98,  -360,  -360,   992,
    -360,   104,   105,  -360,  -360,  -360,    84,    87,    95,   498,
     100,  -360,  -360,   361,  -360,  -360,   -43,  -360,   750,  -360,
    -360,  -360,  -360,   480,   564,  -360,  -360,   119,   750,   122,
    -360,  -360,   108,  -360,  -360,  -360,  1396,   -70,  -360,  -360,
    -360,  -360,  -360,  -360,    84,  -360,   992,  -360,   -48,  -360,
     767,  -360,  -360,   897,  -360,   992,  -360,  -360,  -360,   -24,
     -16,   128,  -360,  -360,  -360,   847,   992,  -360,  -360,   992,
     992,   992,   992,   992,   992,   992,   992,   992,   992,   992,
     992,   992,   992,   992,   992,  -360,  -360,  -360,  1396,  -360,
     111,   112,   992,   992,   113,  -360,  -360,  -360,   -31,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,   992,  -360,  -360,  -360,  -360,   564,  -360,  -360,   992,
     175,   992,  -360,    14,   132,   130,  -360,  -360,  -360,    84,
    -360,  -360,  -360,  -360,   -44,   137,  -360,  1174,   862,    37,
    -360,    40,   992,    84,  -360,   138,   131,     4,    84,  -360,
    -360,  -360,    -8,    -8,     9,     9,   158,   158,   158,   158,
      32,    32,   170,    86,    80,   992,   992,   992,   746,  -360,
      22,  -360,  -360,    26,    47,  -360,  -360,  -360,   992,  -360,
      50,   141,   139,   121,  1137,  -360,    23,  -360,  1356,  -360,
     460,  -360,  -360,  -360,   142,   146,  -360,   143,    40,   147,
     909,  -360,  -360,  -360,   992,  -360,  -360,    82,   201,    -4,
    -360,  -360,   992,   -29,  -360,   133,  -360,  -360,  -360,  -360,
     992,   992,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    1396,  -360,   151,  -360,   992,  -360,    22,  -360,   992,   750,
     750,   750,    59,   129,   148,  -360,  -360,  -360,  -360,   202,
    -360,  -360,   149,   992,  -360,   750,  -360,  -360,   155,  -360,
     750,  -360
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -360,  -360,  -360,   242,  -360,   179,  -360,   213,  -360,  -360,
    -360,  -360,  -360,   -71,    81,  -360,   135,   -39,   -38,   -27,
     -25,    53,    56,    57,   -23,   -26,  -360,   -21,  -360,   -75,
    -360,  -106,  -360,   -99,  -360,   -74,    12,    43,   145,  -360,
     187,  -360,  -360,  -360,   -56,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,   -19,  -360,   -89,  -360,   196,   109,
    -360,   -34,     2,   270,    48,  -360,  -360,  -360,     7,  -360,
     -49,  -360,  -360,  -190,  -360,   -33,  -105,  -270,  -266,  -360,
    -205,  -360,  -154,  -360,  -360,  -360,  -360,  -360,  -147,   -15,
     227,   134,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -359,  -360,     0
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -188
static const yytype_int16 yytable[] =
{
      60,    64,    53,   108,   151,   293,   284,    58,   151,   156,
     110,     1,    41,   246,   211,   246,     1,     1,   151,   199,
     151,   200,   403,   221,   274,     1,     1,   355,     1,   219,
     277,     1,    63,   358,   280,    60,   275,   278,    60,    90,
      53,     1,    60,    42,    68,    58,   236,   237,    55,    75,
      41,    82,   288,   204,   418,   203,   289,   118,    60,    90,
      53,    79,   114,   222,   223,   224,   109,    60,    61,   117,
     258,   205,   108,   119,   355,    60,   194,   117,   204,   220,
     358,    42,   350,   272,   151,   250,    55,     1,    60,   192,
      55,  -187,   198,    83,  -187,   272,   292,   396,   296,   273,
     351,    92,   272,   193,   211,   297,   107,   298,   295,  -187,
    -187,   336,    36,   397,   219,   114,   219,   202,    60,   306,
     229,   115,   277,   107,   120,   230,   231,   307,   365,   339,
     272,   151,   291,   247,    35,   344,   394,   298,   232,   233,
     108,    36,    36,    35,   344,   385,   298,   195,   376,    35,
      36,    62,   272,   333,   334,    70,    36,   108,   297,    35,
     298,   359,   372,   360,   220,   337,   254,   238,   239,   377,
     234,   235,   379,   272,   116,   225,   272,   226,   192,   227,
     340,   412,   342,   192,   192,   272,   240,   241,   192,    76,
      77,    78,   108,   312,   313,   193,   314,   315,  -164,   330,
     404,    36,   157,   206,   114,   214,   216,   217,   218,   316,
     317,   318,   319,   242,   140,   320,   321,   243,   140,   245,
     244,   248,   249,   151,   357,   252,   253,   299,   140,   255,
     140,     1,   378,   122,   123,   124,   125,   256,   126,   127,
     279,   108,   259,   281,   211,   409,   410,   411,   282,   345,
     302,   331,   332,   341,   347,   335,   348,   364,   306,   352,
     363,   419,   380,   381,   386,   272,   421,   388,   387,   389,
     414,   413,   108,   398,   228,   405,   192,   420,   415,   330,
      69,   402,   342,    60,   201,   151,   392,   121,   108,   349,
     346,   417,   108,   393,   140,   322,   375,   151,   395,   323,
     368,   324,   367,   362,   299,   209,   369,   407,   366,   371,
      64,   208,    74,   290,   342,   383,   183,   276,     0,   406,
       0,     0,     0,   151,   408,     0,     0,     0,     0,     0,
      60,     0,     0,     0,   108,     0,     0,     0,     0,     0,
       0,   140,     0,     0,    60,     0,    60,     0,   117,   128,
       0,   346,   155,     0,     0,   129,   130,   131,   132,   133,
     134,     0,   375,     0,   309,   310,   311,   140,   140,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   140,   140,
       0,   260,   261,   262,   263,   264,   265,   266,   267,   268,
     269,    93,     0,     0,     0,     0,    60,    94,    95,   192,
     192,   192,     0,     0,    96,    97,    98,    99,   100,     0,
       0,     0,     0,     0,     0,   192,     0,     0,     0,     0,
     192,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   140,     0,     0,     0,   361,     0,   101,
     102,   103,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     140,   140,   140,     1,     0,   122,   123,   124,   125,     0,
     126,   127,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    84,     0,     1,     2,   122,   123,   124,   125,     0,
     126,   127,     0,     0,     0,   140,     0,     0,     0,     0,
       0,     1,   270,   122,   123,   124,   125,   140,   126,   127,
       3,     4,     5,     6,     7,     8,     9,     0,    10,    11,
      12,     0,    13,     0,     0,    14,    15,    16,    17,   140,
     158,     0,     0,   140,     0,    18,    19,    20,    21,    22,
      23,    24,     0,    25,    26,    27,    28,    29,    30,    31,
      32,     0,     0,   159,   160,   161,     0,   162,   163,   164,
     165,   166,   167,   168,   169,    84,     0,     1,   170,   122,
     123,   124,   125,     0,   126,   127,     0,     0,     0,     0,
       0,   128,     0,     0,     0,     0,     0,   129,   130,   131,
     132,   133,   134,     0,     0,     0,     0,     0,     0,    33,
      34,   128,     0,   210,   384,     0,     0,   129,   130,   131,
     132,   133,   134,     0,   158,     0,     0,     0,     0,   128,
       0,     0,   171,    85,   172,   129,   130,   131,   132,   133,
     134,     0,     0,     0,     0,     0,     0,   159,   160,   161,
     257,   162,   163,   164,   165,   166,   167,   168,   169,     0,
       0,     0,   170,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      84,     0,     0,     2,     0,   128,     0,     0,     0,     0,
       0,   129,   130,   131,   132,   133,   134,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   171,    85,   172,     3,
       4,     5,     6,     7,     8,     9,     0,    10,    11,    12,
       0,    13,     0,     0,    14,    15,    16,    17,     0,     0,
       0,     0,     0,     0,    18,    19,    20,    21,    22,    23,
      24,     0,    25,    26,    27,    28,    29,    30,    31,    32,
       2,    84,     0,     1,     0,   122,   123,   124,   125,     0,
     126,   127,     0,     0,     0,     0,     0,     0,     0,     0,
       1,     0,   122,   123,   124,   125,     0,   126,   127,     0,
       0,     8,     9,     0,    10,    11,    12,     0,    13,     0,
       0,    14,    15,    16,    17,     0,     0,     0,    33,    34,
     158,    18,    19,    20,    21,    22,    23,    24,     0,    25,
      26,    27,    28,    29,    30,    31,    32,     0,     0,     0,
       0,     0,    85,   159,   160,   161,     0,   162,   163,   164,
     165,   166,   167,   168,   169,     0,     0,     0,   170,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       1,     0,   122,   123,   124,   125,     0,   126,   127,     0,
       0,     0,     0,     0,     0,     1,    34,   122,   123,   124,
     125,   128,   126,   127,     0,     0,     0,   129,   130,   131,
     132,   133,   134,     0,     0,     0,     0,     0,   128,     0,
     370,     0,   171,    85,   129,   130,   131,   132,   133,   134,
       1,     2,   122,   123,   124,   125,     0,   126,   127,     0,
     210,     0,     1,     0,   122,   123,   124,   125,     0,   126,
     127,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,     9,     0,    10,    11,    12,     0,    13,
       0,     0,    14,    15,    16,    17,     0,     0,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,     0,
      25,    26,    27,    28,    29,    30,    31,    32,   128,   304,
       0,     0,     0,     0,   129,   130,   131,   132,   133,   134,
       0,     0,     0,   128,     0,     0,   356,     0,     0,   129,
     130,   131,   132,   133,   134,     1,     0,   122,   123,   124,
     125,     0,   126,   127,     0,     0,     0,     1,     0,   122,
     123,   124,   125,     0,   126,   127,     0,    34,   128,     0,
       0,     0,     0,     0,   129,   130,   131,   132,   133,   134,
     128,     1,     2,   391,     0,     0,   129,   130,   131,   132,
     133,   134,     1,     0,   122,   123,   124,   125,     0,   126,
     127,     0,     0,     0,     0,     0,     0,     0,     3,     4,
       5,     6,     7,     8,     9,     0,    10,    11,    12,     0,
      13,     0,     0,    14,    15,    16,    17,     0,     0,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,    24,
       0,    25,    26,    27,    28,    29,    30,    31,    32,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   128,     0,     0,     0,     0,     0,   129,
     130,   131,   132,   133,   134,   213,     0,     0,     0,     0,
       0,   129,   130,   131,   132,   133,   134,     0,     0,     0,
       1,     2,     0,     0,     0,     0,     0,    33,    34,    35,
       0,     0,     0,     0,     0,     0,    36,     0,     0,     0,
     215,     0,     0,     0,     0,     0,   129,   130,   131,   132,
     133,   134,     8,     9,     0,    10,    11,    12,     2,    13,
       0,     0,    14,    15,    16,    17,     0,     0,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,     0,
      25,    26,    27,    28,    29,    30,    31,    32,     0,     8,
       9,     0,    10,    11,    12,     0,    13,     0,     0,    14,
      15,    16,    17,     0,     0,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,    24,     0,    25,    26,    27,
      28,    29,    30,    31,    32,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,   344,   353,
     298,     0,     0,     0,     0,    36,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,   297,   353,   298,     0,     0,
       8,     9,    36,    10,    11,    12,     0,    13,     0,     0,
      14,    15,    16,    17,     2,     0,     0,     0,     0,     0,
      18,    19,    20,    21,    22,    23,    24,     0,    25,    26,
      27,    28,    29,    30,    31,    32,     0,     0,     0,     0,
       3,     4,     5,     6,     7,     8,     9,     0,    10,    11,
      12,     0,    13,     0,     0,    14,    15,    16,    17,     0,
       2,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,    24,     0,    25,    26,    27,    28,    29,    30,    31,
      32,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     8,     9,    36,    10,    11,    12,     0,    13,     0,
       2,    14,    15,    16,    17,   382,     0,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,    24,     0,    25,
      26,    27,    28,    29,    30,    31,    32,     0,     0,    33,
      34,     8,     9,     0,    10,    11,    12,     0,    13,     0,
       0,    14,    15,    16,    17,     0,     0,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,    24,     0,    25,
      26,    27,    28,    29,    30,    31,    32,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34
};

#define yypact_value_is_default(yystate) \
  ((yystate) == (-360))

#define yytable_value_is_error(yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
       0,    35,     0,    59,    79,   210,   196,     0,    83,    83,
      59,     3,     0,    19,   120,    19,     3,     3,    93,    93,
      95,    95,   381,   128,   178,     3,     3,   297,     3,   128,
     184,     3,    32,   299,   188,    35,   183,   184,    38,    54,
      38,     3,    42,     0,     0,    38,    14,    15,     0,    42,
      38,    51,   122,   126,   413,   111,   126,   126,    58,    74,
      58,    41,    62,     9,    10,    11,    59,    67,    52,    67,
     169,   144,   128,   142,   344,    75,    91,    75,   126,   128,
     346,    38,   126,   126,   159,   159,    38,     3,    88,    89,
      42,   123,    92,   123,   126,   126,   144,   126,   122,   142,
     144,   121,   126,    91,   210,   121,    58,   123,   213,   141,
     142,   142,   128,   142,   213,   115,   215,   110,   118,   225,
     128,   143,   276,    75,   141,   133,   134,   226,   124,   276,
     126,   206,   206,   139,   121,   121,   140,   123,   129,   130,
     196,   128,   128,   121,   121,   350,   123,   122,   122,   121,
     128,   143,   126,   252,   253,   142,   128,   213,   121,   121,
     123,   121,   140,   123,   213,   271,   166,   135,   136,   122,
      12,    13,   122,   126,   122,   121,   126,   123,   178,   125,
     279,   122,   281,   183,   184,   126,    16,    17,   188,    44,
      45,    46,   248,   232,   233,   183,   234,   235,   143,   248,
     390,   128,   142,   141,   204,   124,   125,   126,   127,   236,
     237,   238,   239,   127,    79,   240,   241,   137,    83,    18,
     138,   143,   124,   298,   298,   121,   121,   220,    93,   142,
      95,     3,   338,     5,     6,     7,     8,   142,    10,    11,
     121,   297,   142,   121,   350,   399,   400,   401,   140,   283,
     122,   140,   140,    78,   122,   142,   126,   126,   364,   122,
     122,   415,   121,   142,   122,   126,   420,   124,   122,   122,
     122,   142,   328,   140,   139,   124,   276,   122,    76,   328,
      38,   380,   381,   283,   105,   360,   360,    74,   344,   289,
     283,   142,   348,   364,   159,   242,   330,   372,   372,   243,
     326,   244,   325,   303,   297,   118,   327,   396,   308,   328,
     344,   115,    42,   204,   413,   348,    89,   183,    -1,   394,
      -1,    -1,    -1,   398,   398,    -1,    -1,    -1,    -1,    -1,
     330,    -1,    -1,    -1,   390,    -1,    -1,    -1,    -1,    -1,
      -1,   206,    -1,    -1,   344,    -1,   346,    -1,   346,   121,
      -1,   344,   124,    -1,    -1,   127,   128,   129,   130,   131,
     132,    -1,   396,    -1,   229,   230,   231,   232,   233,   234,
     235,   236,   237,   238,   239,   240,   241,   242,   243,   244,
      -1,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    37,    -1,    -1,    -1,    -1,   396,    43,    44,   399,
     400,   401,    -1,    -1,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,    -1,   415,    -1,    -1,    -1,    -1,
     420,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   298,    -1,    -1,    -1,   302,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     325,   326,   327,     3,    -1,     5,     6,     7,     8,    -1,
      10,    11,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,     7,     8,    -1,
      10,    11,    -1,    -1,    -1,   360,    -1,    -1,    -1,    -1,
      -1,     3,   141,     5,     6,     7,     8,   372,    10,    11,
      30,    31,    32,    33,    34,    35,    36,    -1,    38,    39,
      40,    -1,    42,    -1,    -1,    45,    46,    47,    48,   394,
      50,    -1,    -1,   398,    -1,    55,    56,    57,    58,    59,
      60,    61,    -1,    63,    64,    65,    66,    67,    68,    69,
      70,    -1,    -1,    73,    74,    75,    -1,    77,    78,    79,
      80,    81,    82,    83,    84,     1,    -1,     3,    88,     5,
       6,     7,     8,    -1,    10,    11,    -1,    -1,    -1,    -1,
      -1,   121,    -1,    -1,    -1,    -1,    -1,   127,   128,   129,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,   119,
     120,   121,    -1,   143,   144,    -1,    -1,   127,   128,   129,
     130,   131,   132,    -1,    50,    -1,    -1,    -1,    -1,   121,
      -1,    -1,   142,   143,   144,   127,   128,   129,   130,   131,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,    75,
     142,    77,    78,    79,    80,    81,    82,    83,    84,    -1,
      -1,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,    -1,     4,    -1,   121,    -1,    -1,    -1,    -1,
      -1,   127,   128,   129,   130,   131,   132,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   142,   143,   144,    30,
      31,    32,    33,    34,    35,    36,    -1,    38,    39,    40,
      -1,    42,    -1,    -1,    45,    46,    47,    48,    -1,    -1,
      -1,    -1,    -1,    -1,    55,    56,    57,    58,    59,    60,
      61,    -1,    63,    64,    65,    66,    67,    68,    69,    70,
       4,     1,    -1,     3,    -1,     5,     6,     7,     8,    -1,
      10,    11,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,     5,     6,     7,     8,    -1,    10,    11,    -1,
      -1,    35,    36,    -1,    38,    39,    40,    -1,    42,    -1,
      -1,    45,    46,    47,    48,    -1,    -1,    -1,   119,   120,
      50,    55,    56,    57,    58,    59,    60,    61,    -1,    63,
      64,    65,    66,    67,    68,    69,    70,    -1,    -1,    -1,
      -1,    -1,   143,    73,    74,    75,    -1,    77,    78,    79,
      80,    81,    82,    83,    84,    -1,    -1,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,     5,     6,     7,     8,    -1,    10,    11,    -1,
      -1,    -1,    -1,    -1,    -1,     3,   120,     5,     6,     7,
       8,   121,    10,    11,    -1,    -1,    -1,   127,   128,   129,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,   121,    -1,
     144,    -1,   142,   143,   127,   128,   129,   130,   131,   132,
       3,     4,     5,     6,     7,     8,    -1,    10,    11,    -1,
     143,    -1,     3,    -1,     5,     6,     7,     8,    -1,    10,
      11,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    35,    36,    -1,    38,    39,    40,    -1,    42,
      -1,    -1,    45,    46,    47,    48,    -1,    -1,    -1,    -1,
      -1,    -1,    55,    56,    57,    58,    59,    60,    61,    -1,
      63,    64,    65,    66,    67,    68,    69,    70,   121,   122,
      -1,    -1,    -1,    -1,   127,   128,   129,   130,   131,   132,
      -1,    -1,    -1,   121,    -1,    -1,   124,    -1,    -1,   127,
     128,   129,   130,   131,   132,     3,    -1,     5,     6,     7,
       8,    -1,    10,    11,    -1,    -1,    -1,     3,    -1,     5,
       6,     7,     8,    -1,    10,    11,    -1,   120,   121,    -1,
      -1,    -1,    -1,    -1,   127,   128,   129,   130,   131,   132,
     121,     3,     4,   124,    -1,    -1,   127,   128,   129,   130,
     131,   132,     3,    -1,     5,     6,     7,     8,    -1,    10,
      11,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    30,    31,
      32,    33,    34,    35,    36,    -1,    38,    39,    40,    -1,
      42,    -1,    -1,    45,    46,    47,    48,    -1,    -1,    -1,
      -1,    -1,    -1,    55,    56,    57,    58,    59,    60,    61,
      -1,    63,    64,    65,    66,    67,    68,    69,    70,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   121,    -1,    -1,    -1,    -1,    -1,   127,
     128,   129,   130,   131,   132,   121,    -1,    -1,    -1,    -1,
      -1,   127,   128,   129,   130,   131,   132,    -1,    -1,    -1,
       3,     4,    -1,    -1,    -1,    -1,    -1,   119,   120,   121,
      -1,    -1,    -1,    -1,    -1,    -1,   128,    -1,    -1,    -1,
     121,    -1,    -1,    -1,    -1,    -1,   127,   128,   129,   130,
     131,   132,    35,    36,    -1,    38,    39,    40,     4,    42,
      -1,    -1,    45,    46,    47,    48,    -1,    -1,    -1,    -1,
      -1,    -1,    55,    56,    57,    58,    59,    60,    61,    -1,
      63,    64,    65,    66,    67,    68,    69,    70,    -1,    35,
      36,    -1,    38,    39,    40,    -1,    42,    -1,    -1,    45,
      46,    47,    48,    -1,    -1,    -1,    -1,    -1,    -1,    55,
      56,    57,    58,    59,    60,    61,    -1,    63,    64,    65,
      66,    67,    68,    69,    70,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   120,   121,   122,
     123,    -1,    -1,    -1,    -1,   128,    -1,    -1,    -1,     4,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   120,   121,   122,   123,    -1,    -1,
      35,    36,   128,    38,    39,    40,    -1,    42,    -1,    -1,
      45,    46,    47,    48,     4,    -1,    -1,    -1,    -1,    -1,
      55,    56,    57,    58,    59,    60,    61,    -1,    63,    64,
      65,    66,    67,    68,    69,    70,    -1,    -1,    -1,    -1,
      30,    31,    32,    33,    34,    35,    36,    -1,    38,    39,
      40,    -1,    42,    -1,    -1,    45,    46,    47,    48,    -1,
       4,    -1,    -1,    -1,    -1,    55,    56,    57,    58,    59,
      60,    61,    -1,    63,    64,    65,    66,    67,    68,    69,
      70,    -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,
      -1,    35,    36,   128,    38,    39,    40,    -1,    42,    -1,
       4,    45,    46,    47,    48,    49,    -1,    -1,    -1,    -1,
      -1,    55,    56,    57,    58,    59,    60,    61,    -1,    63,
      64,    65,    66,    67,    68,    69,    70,    -1,    -1,   119,
     120,    35,    36,    -1,    38,    39,    40,    -1,    42,    -1,
      -1,    45,    46,    47,    48,    -1,    -1,    -1,    -1,    -1,
      -1,    55,    56,    57,    58,    59,    60,    61,    -1,    63,
      64,    65,    66,    67,    68,    69,    70,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   120
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,     4,    30,    31,    32,    33,    34,    35,    36,
      38,    39,    40,    42,    45,    46,    47,    48,    55,    56,
      57,    58,    59,    60,    61,    63,    64,    65,    66,    67,
      68,    69,    70,   119,   120,   121,   128,   146,   147,   148,
     149,   181,   182,   183,   186,   187,   189,   190,   191,   192,
     193,   195,   202,   207,   208,   209,   210,   211,   213,   214,
     249,    52,   143,   249,   206,   207,   209,   213,     0,   148,
     142,   184,   185,   206,   208,   213,   183,   183,   183,    41,
     196,   197,   249,   123,     1,   143,   152,   181,   182,   232,
     234,   235,   121,    37,    43,    44,    50,    51,    52,    53,
      54,    85,    86,    87,   150,   151,   188,   209,   189,   213,
     215,   216,   203,   204,   249,   143,   122,   207,   126,   142,
     141,   152,     5,     6,     7,     8,    10,    11,   121,   127,
     128,   129,   130,   131,   132,   153,   154,   155,   159,   160,
     161,   162,   163,   164,   165,   166,   167,   168,   169,   170,
     172,   174,   180,   249,   194,   124,   180,   142,    50,    73,
      74,    75,    77,    78,    79,    80,    81,    82,    83,    84,
      88,   142,   144,   161,   174,   176,   178,   227,   228,   229,
     230,   233,   234,   235,   236,   237,   239,   242,   243,   244,
     245,   248,   249,   181,   234,   122,   212,   217,   249,   180,
     180,   150,   213,   189,   126,   144,   141,   205,   203,   185,
     143,   176,   225,   121,   159,   121,   159,   159,   159,   178,
     215,   221,     9,    10,    11,   121,   123,   125,   161,   128,
     133,   134,   129,   130,    12,    13,    14,    15,   135,   136,
      16,    17,   127,   137,   138,    18,    19,   139,   143,   124,
     180,   231,   121,   121,   249,   142,   142,   142,   178,   142,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
     141,   177,   126,   142,   227,   233,   236,   227,   233,   121,
     227,   121,   140,   215,   218,   219,   220,   221,   122,   126,
     204,   180,   144,   225,   226,   221,   122,   121,   123,   213,
     222,   223,   122,   157,   122,   158,   176,   178,   156,   161,
     161,   161,   162,   162,   163,   163,   164,   164,   164,   164,
     165,   165,   166,   167,   168,   171,   173,   175,   198,   199,
     215,   140,   140,   178,   178,   142,   142,   176,   179,   233,
     178,    78,   178,   247,   121,   206,   213,   122,   126,   249,
     126,   144,   122,   122,   218,   222,   124,   180,   223,   121,
     123,   161,   249,   122,   126,   124,   249,   169,   170,   172,
     144,   199,   140,   200,   201,   206,   122,   122,   176,   122,
     121,   142,    49,   220,   144,   225,   122,   122,   124,   122,
     224,   124,   180,   158,   140,   180,   126,   142,   140,   240,
     241,   246,   178,   247,   218,   124,   174,   201,   180,   227,
     227,   227,   122,   142,   122,    76,   238,   142,   247,   227,
     122,   227
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* This macro is provided for backward compatibility. */

#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
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
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  YYSIZE_T yysize1;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = 0;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - Assume YYFAIL is not used.  It's too flawed to consider.  See
       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
       for details.  YYERROR is fine as it does not invoke this
       function.
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                yysize1 = yysize + yytnamerr (0, yytname[yyx]);
                if (! (yysize <= yysize1
                       && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                  return 2;
                yysize = yysize1;
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  yysize1 = yysize + yystrlen (yyformat);
  if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
    return 2;
  yysize = yysize1;

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:

/* Line 1806 of yacc.c  */
#line 137 "SDCC.y"
    { if (!options.lessPedantic)
                    werror(W_EMPTY_SOURCE_FILE);
        }
    break;

  case 6:

/* Line 1806 of yacc.c  */
#line 149 "SDCC.y"
    {
                               blockNo=0;
                             }
    break;

  case 7:

/* Line 1806 of yacc.c  */
#line 152 "SDCC.y"
    {
                               ignoreTypedefType = 0;
                               if ((yyvsp[(1) - (1)].sym) && (yyvsp[(1) - (1)].sym)->type
                                && IS_FUNC((yyvsp[(1) - (1)].sym)->type))
                               {
                                   /* The only legal storage classes for
                                    * a function prototype (declaration)
                                    * are extern and static. extern is the
                                    * default. Thus, if this function isn't
                                    * explicitly marked static, mark it
                                    * extern.
                                    */
                                   if ((yyvsp[(1) - (1)].sym)->etype
                                    && IS_SPEC((yyvsp[(1) - (1)].sym)->etype)
                                    && !SPEC_STAT((yyvsp[(1) - (1)].sym)->etype))
                                   {
                                        SPEC_EXTR((yyvsp[(1) - (1)].sym)->etype) = 1;
                                   }
                               }
                               addSymChain (&(yyvsp[(1) - (1)].sym));
                               allocVariables ((yyvsp[(1) - (1)].sym)) ;
                               cleanUpLevel (SymbolTab,1);
                             }
    break;

  case 8:

/* Line 1806 of yacc.c  */
#line 178 "SDCC.y"
    {   /* function type not specified */
                                   /* assume it to be 'int'       */
                                   addDecl((yyvsp[(1) - (2)].sym),0,newIntLink());
                                   (yyval.asts) = createFunction((yyvsp[(1) - (2)].sym),(yyvsp[(2) - (2)].asts));
                               }
    break;

  case 9:

/* Line 1806 of yacc.c  */
#line 184 "SDCC.y"
    {
                                    pointerTypes((yyvsp[(2) - (3)].sym)->type,copyLinkChain((yyvsp[(1) - (3)].lnk)));
                                    addDecl((yyvsp[(2) - (3)].sym),0,(yyvsp[(1) - (3)].lnk));
                                    (yyval.asts) = createFunction((yyvsp[(2) - (3)].sym),(yyvsp[(3) - (3)].asts));
                                }
    break;

  case 11:

/* Line 1806 of yacc.c  */
#line 193 "SDCC.y"
    { (yyval.lnk) = mergeSpec((yyvsp[(1) - (2)].lnk),(yyvsp[(2) - (2)].lnk),"function_attribute"); }
    break;

  case 12:

/* Line 1806 of yacc.c  */
#line 197 "SDCC.y"
    {
                        (yyval.lnk) = newLink(SPECIFIER) ;
                        FUNC_REGBANK((yyval.lnk)) = (int) ulFromVal(constExprValue((yyvsp[(2) - (2)].asts),TRUE));
                     }
    break;

  case 13:

/* Line 1806 of yacc.c  */
#line 201 "SDCC.y"
    {  (yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISREENT((yyval.lnk))=1;
                     }
    break;

  case 14:

/* Line 1806 of yacc.c  */
#line 204 "SDCC.y"
    {  (yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISCRITICAL((yyval.lnk)) = 1;
                     }
    break;

  case 15:

/* Line 1806 of yacc.c  */
#line 207 "SDCC.y"
    {  (yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISNAKED((yyval.lnk))=1;
                     }
    break;

  case 16:

/* Line 1806 of yacc.c  */
#line 210 "SDCC.y"
    {  (yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISJAVANATIVE((yyval.lnk))=1;
                     }
    break;

  case 17:

/* Line 1806 of yacc.c  */
#line 213 "SDCC.y"
    {  (yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISOVERLAY((yyval.lnk))=1;
                     }
    break;

  case 18:

/* Line 1806 of yacc.c  */
#line 216 "SDCC.y"
    {(yyval.lnk) = newLink (SPECIFIER);
                        FUNC_NONBANKED((yyval.lnk)) = 1;
                        if (FUNC_BANKED((yyval.lnk))) {
                            werror(W_BANKED_WITH_NONBANKED);
                        }
                     }
    break;

  case 19:

/* Line 1806 of yacc.c  */
#line 222 "SDCC.y"
    {(yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISSHADOWREGS((yyval.lnk)) = 1;
                     }
    break;

  case 20:

/* Line 1806 of yacc.c  */
#line 225 "SDCC.y"
    {(yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISWPARAM((yyval.lnk)) = 1;
                     }
    break;

  case 21:

/* Line 1806 of yacc.c  */
#line 228 "SDCC.y"
    {(yyval.lnk) = newLink (SPECIFIER);
                        FUNC_BANKED((yyval.lnk)) = 1;
                        if (FUNC_NONBANKED((yyval.lnk))) {
                            werror(W_BANKED_WITH_NONBANKED);
                        }
                        if (SPEC_STAT((yyval.lnk))) {
                            werror(W_BANKED_WITH_STATIC);
                        }
                     }
    break;

  case 22:

/* Line 1806 of yacc.c  */
#line 238 "SDCC.y"
    {
                        (yyval.lnk) = newLink (SPECIFIER) ;
                        FUNC_INTNO((yyval.lnk)) = (yyvsp[(1) - (1)].yyint) ;
                        FUNC_ISISR((yyval.lnk)) = 1;
                     }
    break;

  case 24:

/* Line 1806 of yacc.c  */
#line 248 "SDCC.y"
    {
            werror(E_OLD_STYLE,((yyvsp[(1) - (2)].sym) ? (yyvsp[(1) - (2)].sym)->name: "")) ;
            exit(1);
         }
    break;

  case 25:

/* Line 1806 of yacc.c  */
#line 255 "SDCC.y"
    {  (yyval.asts) = newAst_VALUE(symbolVal((yyvsp[(1) - (1)].sym)));  }
    break;

  case 26:

/* Line 1806 of yacc.c  */
#line 256 "SDCC.y"
    {  (yyval.asts) = newAst_VALUE((yyvsp[(1) - (1)].val));  }
    break;

  case 28:

/* Line 1806 of yacc.c  */
#line 258 "SDCC.y"
    {  (yyval.asts) = (yyvsp[(2) - (3)].asts) ;                   }
    break;

  case 29:

/* Line 1806 of yacc.c  */
#line 262 "SDCC.y"
    { (yyval.asts) = newAst_VALUE((yyvsp[(1) - (1)].val)); }
    break;

  case 31:

/* Line 1806 of yacc.c  */
#line 267 "SDCC.y"
    { (yyval.asts) = newNode  ('[', (yyvsp[(1) - (4)].asts), (yyvsp[(3) - (4)].asts)) ; }
    break;

  case 32:

/* Line 1806 of yacc.c  */
#line 268 "SDCC.y"
    { (yyval.asts) = newNode  (CALL,(yyvsp[(1) - (3)].asts),NULL);
                                          (yyval.asts)->left->funcName = 1;}
    break;

  case 33:

/* Line 1806 of yacc.c  */
#line 271 "SDCC.y"
    {
            (yyval.asts) = newNode  (CALL,(yyvsp[(1) - (4)].asts),(yyvsp[(3) - (4)].asts)) ; (yyval.asts)->left->funcName = 1;
          }
    break;

  case 34:

/* Line 1806 of yacc.c  */
#line 274 "SDCC.y"
    { ignoreTypedefType = 1; }
    break;

  case 35:

/* Line 1806 of yacc.c  */
#line 275 "SDCC.y"
    {
                        ignoreTypedefType = 0;
                        (yyvsp[(4) - (4)].sym) = newSymbol((yyvsp[(4) - (4)].sym)->name,NestLevel);
                        (yyvsp[(4) - (4)].sym)->implicit = 1;
                        (yyval.asts) = newNode(PTR_OP,newNode('&',(yyvsp[(1) - (4)].asts),NULL),newAst_VALUE(symbolVal((yyvsp[(4) - (4)].sym))));
                      }
    break;

  case 36:

/* Line 1806 of yacc.c  */
#line 281 "SDCC.y"
    { ignoreTypedefType = 1; }
    break;

  case 37:

/* Line 1806 of yacc.c  */
#line 282 "SDCC.y"
    {
                        ignoreTypedefType = 0;
                        (yyvsp[(4) - (4)].sym) = newSymbol((yyvsp[(4) - (4)].sym)->name,NestLevel);
                        (yyvsp[(4) - (4)].sym)->implicit = 1;
                        (yyval.asts) = newNode(PTR_OP,(yyvsp[(1) - (4)].asts),newAst_VALUE(symbolVal((yyvsp[(4) - (4)].sym))));
                      }
    break;

  case 38:

/* Line 1806 of yacc.c  */
#line 289 "SDCC.y"
    { (yyval.asts) = newNode(INC_OP,(yyvsp[(1) - (2)].asts),NULL);}
    break;

  case 39:

/* Line 1806 of yacc.c  */
#line 291 "SDCC.y"
    { (yyval.asts) = newNode(DEC_OP,(yyvsp[(1) - (2)].asts),NULL); }
    break;

  case 41:

/* Line 1806 of yacc.c  */
#line 296 "SDCC.y"
    { (yyval.asts) = newNode(PARAM,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts)); }
    break;

  case 43:

/* Line 1806 of yacc.c  */
#line 301 "SDCC.y"
    { (yyval.asts) = newNode(INC_OP,NULL,(yyvsp[(2) - (2)].asts));  }
    break;

  case 44:

/* Line 1806 of yacc.c  */
#line 302 "SDCC.y"
    { (yyval.asts) = newNode(DEC_OP,NULL,(yyvsp[(2) - (2)].asts));  }
    break;

  case 45:

/* Line 1806 of yacc.c  */
#line 303 "SDCC.y"
    { (yyval.asts) = newNode((yyvsp[(1) - (2)].yyint),(yyvsp[(2) - (2)].asts),NULL)    ;  }
    break;

  case 46:

/* Line 1806 of yacc.c  */
#line 304 "SDCC.y"
    { (yyval.asts) = newNode(SIZEOF,NULL,(yyvsp[(2) - (2)].asts));  }
    break;

  case 47:

/* Line 1806 of yacc.c  */
#line 305 "SDCC.y"
    { (yyval.asts) = newAst_VALUE(sizeofOp((yyvsp[(3) - (4)].lnk))); }
    break;

  case 48:

/* Line 1806 of yacc.c  */
#line 306 "SDCC.y"
    { (yyval.asts) = newNode(TYPEOF,NULL,(yyvsp[(2) - (2)].asts));  }
    break;

  case 49:

/* Line 1806 of yacc.c  */
#line 310 "SDCC.y"
    { (yyval.yyint) = '&' ;}
    break;

  case 50:

/* Line 1806 of yacc.c  */
#line 311 "SDCC.y"
    { (yyval.yyint) = '*' ;}
    break;

  case 51:

/* Line 1806 of yacc.c  */
#line 312 "SDCC.y"
    { (yyval.yyint) = '+' ;}
    break;

  case 52:

/* Line 1806 of yacc.c  */
#line 313 "SDCC.y"
    { (yyval.yyint) = '-' ;}
    break;

  case 53:

/* Line 1806 of yacc.c  */
#line 314 "SDCC.y"
    { (yyval.yyint) = '~' ;}
    break;

  case 54:

/* Line 1806 of yacc.c  */
#line 315 "SDCC.y"
    { (yyval.yyint) = '!' ;}
    break;

  case 56:

/* Line 1806 of yacc.c  */
#line 320 "SDCC.y"
    { (yyval.asts) = newNode(CAST,newAst_LINK((yyvsp[(2) - (4)].lnk)),(yyvsp[(4) - (4)].asts)); }
    break;

  case 58:

/* Line 1806 of yacc.c  */
#line 325 "SDCC.y"
    { (yyval.asts) = newNode('*',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 59:

/* Line 1806 of yacc.c  */
#line 326 "SDCC.y"
    { (yyval.asts) = newNode('/',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 60:

/* Line 1806 of yacc.c  */
#line 327 "SDCC.y"
    { (yyval.asts) = newNode('%',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 62:

/* Line 1806 of yacc.c  */
#line 332 "SDCC.y"
    { (yyval.asts)=newNode('+',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 63:

/* Line 1806 of yacc.c  */
#line 333 "SDCC.y"
    { (yyval.asts)=newNode('-',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 65:

/* Line 1806 of yacc.c  */
#line 338 "SDCC.y"
    { (yyval.asts) = newNode(LEFT_OP,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts)); }
    break;

  case 66:

/* Line 1806 of yacc.c  */
#line 339 "SDCC.y"
    { (yyval.asts) = newNode(RIGHT_OP,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts)); }
    break;

  case 68:

/* Line 1806 of yacc.c  */
#line 344 "SDCC.y"
    { (yyval.asts) = newNode('<',  (yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 69:

/* Line 1806 of yacc.c  */
#line 345 "SDCC.y"
    { (yyval.asts) = newNode('>',  (yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 70:

/* Line 1806 of yacc.c  */
#line 346 "SDCC.y"
    { (yyval.asts) = newNode(LE_OP,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 71:

/* Line 1806 of yacc.c  */
#line 347 "SDCC.y"
    { (yyval.asts) = newNode(GE_OP,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 73:

/* Line 1806 of yacc.c  */
#line 352 "SDCC.y"
    { (yyval.asts) = newNode(EQ_OP,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 74:

/* Line 1806 of yacc.c  */
#line 353 "SDCC.y"
    { (yyval.asts) = newNode(NE_OP,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 76:

/* Line 1806 of yacc.c  */
#line 358 "SDCC.y"
    { (yyval.asts) = newNode('&',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 78:

/* Line 1806 of yacc.c  */
#line 363 "SDCC.y"
    { (yyval.asts) = newNode('^',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 80:

/* Line 1806 of yacc.c  */
#line 368 "SDCC.y"
    { (yyval.asts) = newNode('|',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 82:

/* Line 1806 of yacc.c  */
#line 373 "SDCC.y"
    { seqPointNo++;}
    break;

  case 83:

/* Line 1806 of yacc.c  */
#line 374 "SDCC.y"
    { (yyval.asts) = newNode(AND_OP,(yyvsp[(1) - (4)].asts),(yyvsp[(4) - (4)].asts));}
    break;

  case 85:

/* Line 1806 of yacc.c  */
#line 379 "SDCC.y"
    { seqPointNo++;}
    break;

  case 86:

/* Line 1806 of yacc.c  */
#line 380 "SDCC.y"
    { (yyval.asts) = newNode(OR_OP,(yyvsp[(1) - (4)].asts),(yyvsp[(4) - (4)].asts)); }
    break;

  case 88:

/* Line 1806 of yacc.c  */
#line 385 "SDCC.y"
    { seqPointNo++;}
    break;

  case 89:

/* Line 1806 of yacc.c  */
#line 386 "SDCC.y"
    {
                        (yyval.asts) = newNode(':',(yyvsp[(4) - (6)].asts),(yyvsp[(6) - (6)].asts)) ;
                        (yyval.asts) = newNode('?',(yyvsp[(1) - (6)].asts),(yyval.asts)) ;
                     }
    break;

  case 91:

/* Line 1806 of yacc.c  */
#line 395 "SDCC.y"
    {

                             switch ((yyvsp[(2) - (3)].yyint)) {
                             case '=':
                                     (yyval.asts) = newNode((yyvsp[(2) - (3)].yyint),(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));
                                     break;
                             case MUL_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '*', (yyvsp[(3) - (3)].asts));
                                     break;
                             case DIV_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '/', (yyvsp[(3) - (3)].asts));
                                     break;
                             case MOD_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '%', (yyvsp[(3) - (3)].asts));
                                     break;
                             case ADD_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '+', (yyvsp[(3) - (3)].asts));
                                     break;
                             case SUB_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '-', (yyvsp[(3) - (3)].asts));
                                     break;
                             case LEFT_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), LEFT_OP, (yyvsp[(3) - (3)].asts));
                                     break;
                             case RIGHT_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), RIGHT_OP, (yyvsp[(3) - (3)].asts));
                                     break;
                             case AND_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '&', (yyvsp[(3) - (3)].asts));
                                     break;
                             case XOR_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '^', (yyvsp[(3) - (3)].asts));
                                     break;
                             case OR_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '|', (yyvsp[(3) - (3)].asts));
                                     break;
                             default :
                                     (yyval.asts) = NULL;
                             }

                     }
    break;

  case 92:

/* Line 1806 of yacc.c  */
#line 439 "SDCC.y"
    { (yyval.yyint) = '=' ;}
    break;

  case 104:

/* Line 1806 of yacc.c  */
#line 454 "SDCC.y"
    { seqPointNo++;}
    break;

  case 105:

/* Line 1806 of yacc.c  */
#line 454 "SDCC.y"
    { (yyval.asts) = newNode(',',(yyvsp[(1) - (4)].asts),(yyvsp[(4) - (4)].asts));}
    break;

  case 107:

/* Line 1806 of yacc.c  */
#line 463 "SDCC.y"
    {
         if (uselessDecl)
           werror(W_USELESS_DECL);
         uselessDecl = TRUE;
         (yyval.sym) = NULL ;
      }
    break;

  case 108:

/* Line 1806 of yacc.c  */
#line 470 "SDCC.y"
    {
         /* add the specifier list to the id */
         symbol *sym , *sym1;

         for (sym1 = sym = reverseSyms((yyvsp[(2) - (3)].sym));sym != NULL;sym = sym->next) {
             sym_link *lnk = copyLinkChain((yyvsp[(1) - (3)].lnk));
             /* do the pointer stuff */
             pointerTypes(sym->type,lnk);
             addDecl (sym,0,lnk) ;
         }

         uselessDecl = TRUE;
         (yyval.sym) = sym1 ;
      }
    break;

  case 109:

/* Line 1806 of yacc.c  */
#line 486 "SDCC.y"
    { (yyval.lnk) = finalizeSpec((yyvsp[(1) - (1)].lnk)); }
    break;

  case 110:

/* Line 1806 of yacc.c  */
#line 489 "SDCC.y"
    { (yyval.lnk) = (yyvsp[(1) - (1)].lnk); }
    break;

  case 111:

/* Line 1806 of yacc.c  */
#line 490 "SDCC.y"
    {
     /* if the decl $2 is not a specifier */
     /* find the spec and replace it      */
     (yyval.lnk) = mergeDeclSpec((yyvsp[(1) - (2)].lnk), (yyvsp[(2) - (2)].lnk), "storage_class_specifier declaration_specifiers - skipped");
   }
    break;

  case 112:

/* Line 1806 of yacc.c  */
#line 495 "SDCC.y"
    { (yyval.lnk) = (yyvsp[(1) - (1)].lnk); }
    break;

  case 113:

/* Line 1806 of yacc.c  */
#line 496 "SDCC.y"
    {
     /* if the decl $2 is not a specifier */
     /* find the spec and replace it      */
     (yyval.lnk) = mergeDeclSpec((yyvsp[(1) - (2)].lnk), (yyvsp[(2) - (2)].lnk), "type_specifier declaration_specifiers - skipped");
   }
    break;

  case 114:

/* Line 1806 of yacc.c  */
#line 501 "SDCC.y"
    { (yyval.lnk) = (yyvsp[(1) - (1)].lnk); }
    break;

  case 115:

/* Line 1806 of yacc.c  */
#line 502 "SDCC.y"
    {
     /* if the decl $2 is not a specifier */
     /* find the spec and replace it      */
     (yyval.lnk) = mergeDeclSpec((yyvsp[(1) - (2)].lnk), (yyvsp[(2) - (2)].lnk), "function_specifier declaration_specifiers - skipped");
   }
    break;

  case 117:

/* Line 1806 of yacc.c  */
#line 511 "SDCC.y"
    { (yyvsp[(3) - (3)].sym)->next = (yyvsp[(1) - (3)].sym) ; (yyval.sym) = (yyvsp[(3) - (3)].sym);}
    break;

  case 118:

/* Line 1806 of yacc.c  */
#line 515 "SDCC.y"
    { (yyvsp[(1) - (1)].sym)->ival = NULL ; }
    break;

  case 119:

/* Line 1806 of yacc.c  */
#line 516 "SDCC.y"
    { (yyvsp[(1) - (3)].sym)->ival = (yyvsp[(3) - (3)].ilist)   ; }
    break;

  case 120:

/* Line 1806 of yacc.c  */
#line 521 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER) ;
                  SPEC_TYPEDEF((yyval.lnk)) = 1 ;
               }
    break;

  case 121:

/* Line 1806 of yacc.c  */
#line 525 "SDCC.y"
    {
                  (yyval.lnk) = newLink(SPECIFIER);
                  SPEC_EXTR((yyval.lnk)) = 1 ;
               }
    break;

  case 122:

/* Line 1806 of yacc.c  */
#line 529 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER);
                  SPEC_STAT((yyval.lnk)) = 1 ;
               }
    break;

  case 123:

/* Line 1806 of yacc.c  */
#line 533 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER) ;
                  SPEC_SCLS((yyval.lnk)) = S_AUTO  ;
               }
    break;

  case 124:

/* Line 1806 of yacc.c  */
#line 537 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER);
                  SPEC_SCLS((yyval.lnk)) = S_REGISTER ;
               }
    break;

  case 125:

/* Line 1806 of yacc.c  */
#line 544 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER) ;
                  SPEC_INLINE((yyval.lnk)) = 1 ;
               }
    break;

  case 126:

/* Line 1806 of yacc.c  */
#line 551 "SDCC.y"
    { (yyval.yyint) = INTNO_UNSPEC ; }
    break;

  case 127:

/* Line 1806 of yacc.c  */
#line 553 "SDCC.y"
    { int intno = (int) ulFromVal(constExprValue((yyvsp[(2) - (2)].asts),TRUE));
          if ((intno >= 0) && (intno <= INTNO_MAX))
            (yyval.yyint) = intno;
          else
            {
              werror(E_INT_BAD_INTNO, intno);
              (yyval.yyint) = INTNO_UNSPEC;
            }
        }
    break;

  case 129:

/* Line 1806 of yacc.c  */
#line 567 "SDCC.y"
    {
           /* add this to the storage class specifier  */
           SPEC_ABSA((yyvsp[(1) - (3)].lnk)) = 1;   /* set the absolute addr flag */
           /* now get the abs addr from value */
           SPEC_ADDR((yyvsp[(1) - (3)].lnk)) = (unsigned int) ulFromVal(constExprValue((yyvsp[(3) - (3)].asts),TRUE)) ;
        }
    break;

  case 130:

/* Line 1806 of yacc.c  */
#line 576 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_NOUN((yyval.lnk)) = V_CHAR  ;
                  ignoreTypedefType = 1;
               }
    break;

  case 131:

/* Line 1806 of yacc.c  */
#line 581 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_SHORT((yyval.lnk)) = 1 ;
                  ignoreTypedefType = 1;
               }
    break;

  case 132:

/* Line 1806 of yacc.c  */
#line 586 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_NOUN((yyval.lnk)) = V_INT   ;
                  ignoreTypedefType = 1;
               }
    break;

  case 133:

/* Line 1806 of yacc.c  */
#line 591 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_LONG((yyval.lnk)) = 1       ;
                  ignoreTypedefType = 1;
               }
    break;

  case 134:

/* Line 1806 of yacc.c  */
#line 596 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  (yyval.lnk)->select.s.b_signed = 1;
                  ignoreTypedefType = 1;
               }
    break;

  case 135:

/* Line 1806 of yacc.c  */
#line 601 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_USIGN((yyval.lnk)) = 1      ;
                  ignoreTypedefType = 1;
               }
    break;

  case 136:

/* Line 1806 of yacc.c  */
#line 606 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_NOUN((yyval.lnk)) = V_VOID  ;
                  ignoreTypedefType = 1;
               }
    break;

  case 137:

/* Line 1806 of yacc.c  */
#line 611 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_CONST((yyval.lnk)) = 1;
               }
    break;

  case 138:

/* Line 1806 of yacc.c  */
#line 615 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_VOLATILE((yyval.lnk)) = 1 ;
               }
    break;

  case 139:

/* Line 1806 of yacc.c  */
#line 619 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_RESTRICT((yyval.lnk)) = 1 ;
               }
    break;

  case 140:

/* Line 1806 of yacc.c  */
#line 623 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_NOUN((yyval.lnk)) = V_FLOAT;
                  ignoreTypedefType = 1;
               }
    break;

  case 141:

/* Line 1806 of yacc.c  */
#line 628 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_NOUN((yyval.lnk)) = V_FIXED16X16;
                  ignoreTypedefType = 1;
               }
    break;

  case 142:

/* Line 1806 of yacc.c  */
#line 633 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER);
                  SPEC_SCLS((yyval.lnk)) = S_XDATA  ;
               }
    break;

  case 143:

/* Line 1806 of yacc.c  */
#line 637 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER) ;
                  SPEC_SCLS((yyval.lnk)) = S_CODE ;
               }
    break;

  case 144:

/* Line 1806 of yacc.c  */
#line 641 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER) ;
                  SPEC_SCLS((yyval.lnk)) = S_EEPROM ;
               }
    break;

  case 145:

/* Line 1806 of yacc.c  */
#line 645 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER);
                  SPEC_SCLS((yyval.lnk)) = S_DATA   ;
               }
    break;

  case 146:

/* Line 1806 of yacc.c  */
#line 649 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER);
                  SPEC_SCLS((yyval.lnk)) = S_IDATA  ;
               }
    break;

  case 147:

/* Line 1806 of yacc.c  */
#line 653 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER);
                  SPEC_SCLS((yyval.lnk)) = S_PDATA  ;
               }
    break;

  case 148:

/* Line 1806 of yacc.c  */
#line 657 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_NOUN((yyval.lnk)) = V_BIT   ;
                  SPEC_SCLS((yyval.lnk)) = S_BIT   ;
                  SPEC_BLEN((yyval.lnk)) = 1;
                  SPEC_BSTR((yyval.lnk)) = 0;
                  ignoreTypedefType = 1;
               }
    break;

  case 149:

/* Line 1806 of yacc.c  */
#line 666 "SDCC.y"
    {
                                   uselessDecl = FALSE;
                                   (yyval.lnk) = (yyvsp[(1) - (1)].lnk) ;
                                   ignoreTypedefType = 1;
                                }
    break;

  case 150:

/* Line 1806 of yacc.c  */
#line 671 "SDCC.y"
    {
                           cenum = NULL ;
                           uselessDecl = FALSE;
                           ignoreTypedefType = 1;
                           (yyval.lnk) = (yyvsp[(1) - (1)].lnk) ;
                        }
    break;

  case 151:

/* Line 1806 of yacc.c  */
#line 678 "SDCC.y"
    {
            symbol *sym;
            sym_link   *p  ;
            sym = findSym(TypedefTab,NULL,(yyvsp[(1) - (1)].yychar)) ;
            (yyval.lnk) = p = copyLinkChain(sym ? sym->type : NULL);
            SPEC_TYPEDEF(getSpec(p)) = 0;
            ignoreTypedefType = 1;
         }
    break;

  case 153:

/* Line 1806 of yacc.c  */
#line 690 "SDCC.y"
    {
               (yyval.lnk) = newLink(SPECIFIER) ;
               SPEC_NOUN((yyval.lnk)) = V_SBIT;
               SPEC_SCLS((yyval.lnk)) = S_SBIT;
               SPEC_BLEN((yyval.lnk)) = 1;
               SPEC_BSTR((yyval.lnk)) = 0;
               ignoreTypedefType = 1;
            }
    break;

  case 155:

/* Line 1806 of yacc.c  */
#line 702 "SDCC.y"
    {
               (yyval.lnk) = newLink(SPECIFIER) ;
               FUNC_REGBANK((yyval.lnk)) = 0;
               SPEC_NOUN((yyval.lnk))    = V_CHAR;
               SPEC_SCLS((yyval.lnk))    = S_SFR ;
               SPEC_USIGN((yyval.lnk))   = 1 ;
               ignoreTypedefType = 1;
            }
    break;

  case 156:

/* Line 1806 of yacc.c  */
#line 710 "SDCC.y"
    {
               (yyval.lnk) = newLink(SPECIFIER) ;
               FUNC_REGBANK((yyval.lnk)) = 1;
               SPEC_NOUN((yyval.lnk))    = V_CHAR;
               SPEC_SCLS((yyval.lnk))    = S_SFR ;
               SPEC_USIGN((yyval.lnk))   = 1 ;
               ignoreTypedefType = 1;
            }
    break;

  case 157:

/* Line 1806 of yacc.c  */
#line 721 "SDCC.y"
    {
               (yyval.lnk) = newLink(SPECIFIER) ;
               FUNC_REGBANK((yyval.lnk)) = 0;
               SPEC_NOUN((yyval.lnk))    = V_INT;
               SPEC_SCLS((yyval.lnk))    = S_SFR;
               SPEC_USIGN((yyval.lnk))   = 1 ;
               ignoreTypedefType = 1;
            }
    break;

  case 158:

/* Line 1806 of yacc.c  */
#line 732 "SDCC.y"
    {
               (yyval.lnk) = newLink(SPECIFIER) ;
               FUNC_REGBANK((yyval.lnk)) = 0;
               SPEC_NOUN((yyval.lnk))    = V_INT;
               SPEC_SCLS((yyval.lnk))    = S_SFR;
               SPEC_LONG((yyval.lnk))    = 1;
               SPEC_USIGN((yyval.lnk))   = 1;
               ignoreTypedefType = 1;
            }
    break;

  case 159:

/* Line 1806 of yacc.c  */
#line 745 "SDCC.y"
    {
           if (!(yyvsp[(2) - (2)].sdef)->type)
             {
               (yyvsp[(2) - (2)].sdef)->type = (yyvsp[(1) - (2)].yyint);
             }
           else
             {
               if ((yyvsp[(2) - (2)].sdef)->type != (yyvsp[(1) - (2)].yyint))
                 werror(E_BAD_TAG, (yyvsp[(2) - (2)].sdef)->tag, (yyvsp[(1) - (2)].yyint)==STRUCT ? "struct" : "union");
             }

        }
    break;

  case 160:

/* Line 1806 of yacc.c  */
#line 758 "SDCC.y"
    {
           structdef *sdef ;
           symbol *sym, *dsym;

           // check for errors in structure members
           for (sym=(yyvsp[(5) - (6)].sym); sym; sym=sym->next) {
             if (IS_ABSOLUTE(sym->etype)) {
               werrorfl(sym->fileDef, sym->lineDef, E_NOT_ALLOWED, "'at'");
               SPEC_ABSA(sym->etype) = 0;
             }
             if (IS_SPEC(sym->etype) && SPEC_SCLS(sym->etype)) {
               werrorfl(sym->fileDef, sym->lineDef, E_NOT_ALLOWED, "storage class");
               printTypeChainRaw (sym->type,NULL);
               SPEC_SCLS(sym->etype) = 0;
             }
             for (dsym=sym->next; dsym; dsym=dsym->next) {
               if (*dsym->name && strcmp(sym->name, dsym->name)==0) {
                 werrorfl(sym->fileDef, sym->lineDef, E_DUPLICATE_MEMBER,
                        (yyvsp[(1) - (6)].yyint)==STRUCT ? "struct" : "union", sym->name);
                 werrorfl(dsym->fileDef, dsym->lineDef, E_PREVIOUS_DEF);
               }
             }
           }

           /* Create a structdef   */
           sdef = (yyvsp[(2) - (6)].sdef) ;
           sdef->fields   = reverseSyms((yyvsp[(5) - (6)].sym)) ;   /* link the fields */
           sdef->size  = compStructSize((yyvsp[(1) - (6)].yyint),sdef);   /* update size of  */
           promoteAnonStructs ((yyvsp[(1) - (6)].yyint), sdef);

           /* Create the specifier */
           (yyval.lnk) = newLink (SPECIFIER) ;
           SPEC_NOUN((yyval.lnk)) = V_STRUCT;
           SPEC_STRUCT((yyval.lnk))= sdef ;
        }
    break;

  case 161:

/* Line 1806 of yacc.c  */
#line 794 "SDCC.y"
    {
            (yyval.lnk) = newLink(SPECIFIER) ;
            SPEC_NOUN((yyval.lnk)) = V_STRUCT;
            SPEC_STRUCT((yyval.lnk)) = (yyvsp[(2) - (2)].sdef);

           if (!(yyvsp[(2) - (2)].sdef)->type)
             {
               (yyvsp[(2) - (2)].sdef)->type = (yyvsp[(1) - (2)].yyint);
             }
           else
             {
               if ((yyvsp[(2) - (2)].sdef)->type != (yyvsp[(1) - (2)].yyint))
                 werror(E_BAD_TAG, (yyvsp[(2) - (2)].sdef)->tag, (yyvsp[(1) - (2)].yyint)==STRUCT ? "struct" : "union");
             }
         }
    break;

  case 162:

/* Line 1806 of yacc.c  */
#line 812 "SDCC.y"
    { (yyval.yyint) = STRUCT ; }
    break;

  case 163:

/* Line 1806 of yacc.c  */
#line 813 "SDCC.y"
    { (yyval.yyint) = UNION  ; }
    break;

  case 165:

/* Line 1806 of yacc.c  */
#line 818 "SDCC.y"
    {  /* synthesize a name add to structtable */
     (yyval.sdef) = newStruct(genSymName(NestLevel)) ;
     (yyval.sdef)->level = NestLevel ;
     addSym (StructTab, (yyval.sdef), (yyval.sdef)->tag,(yyval.sdef)->level,currBlockno, 0);
}
    break;

  case 166:

/* Line 1806 of yacc.c  */
#line 825 "SDCC.y"
    {  /* add name to structure table */
     (yyval.sdef) = findSymWithBlock (StructTab,(yyvsp[(1) - (1)].sym),currBlockno);
     if (! (yyval.sdef) ) {
       (yyval.sdef) = newStruct((yyvsp[(1) - (1)].sym)->name) ;
       (yyval.sdef)->level = NestLevel ;
       addSym (StructTab, (yyval.sdef), (yyval.sdef)->tag,(yyval.sdef)->level,currBlockno,0);
     }
}
    break;

  case 168:

/* Line 1806 of yacc.c  */
#line 838 "SDCC.y"
    {
           symbol *sym=(yyvsp[(2) - (2)].sym);

           /* go to the end of the chain */
           while (sym->next) sym=sym->next;
           sym->next = (yyvsp[(1) - (2)].sym) ;

           (yyval.sym) = (yyvsp[(2) - (2)].sym);
       }
    break;

  case 169:

/* Line 1806 of yacc.c  */
#line 851 "SDCC.y"
    {
           /* add this type to all the symbols */
           symbol *sym ;
           for ( sym = (yyvsp[(2) - (3)].sym) ; sym != NULL ; sym = sym->next ) {
               sym_link *btype = copyLinkChain((yyvsp[(1) - (3)].lnk));

               /* make the symbol one level up */
               sym->level-- ;

               pointerTypes(sym->type,btype);
               if (!sym->type) {
                   sym->type = btype;
                   sym->etype = getSpec(sym->type);
               }
               else
                 addDecl (sym,0,btype);
               /* make sure the type is complete and sane */
               checkTypeSanity(sym->etype, sym->name);
           }
           ignoreTypedefType = 0;
           (yyval.sym) = (yyvsp[(2) - (3)].sym);
       }
    break;

  case 171:

/* Line 1806 of yacc.c  */
#line 878 "SDCC.y"
    {
           (yyvsp[(3) - (3)].sym)->next  = (yyvsp[(1) - (3)].sym) ;
           (yyval.sym) = (yyvsp[(3) - (3)].sym) ;
       }
    break;

  case 173:

/* Line 1806 of yacc.c  */
#line 886 "SDCC.y"
    {
                           unsigned int bitsize;
                           (yyval.sym) = newSymbol (genSymName(NestLevel),NestLevel) ;
                           bitsize = (unsigned int) ulFromVal(constExprValue((yyvsp[(2) - (2)].asts),TRUE));
                           if (bitsize > (port->s.int_size * 8)) {
                             bitsize = port->s.int_size * 8;
                             werror(E_BITFLD_SIZE, bitsize);
                           }
                           if (!bitsize)
                             bitsize = BITVAR_PAD;
                           (yyval.sym)->bitVar = bitsize;
                           (yyval.sym)->bitUnnamed = 1;
                        }
    break;

  case 174:

/* Line 1806 of yacc.c  */
#line 900 "SDCC.y"
    {
                          unsigned int bitsize;
                          bitsize = (unsigned int) ulFromVal(constExprValue((yyvsp[(3) - (3)].asts),TRUE));
                          if (bitsize > (port->s.int_size * 8)) {
                            bitsize = port->s.int_size * 8;
                            werror(E_BITFLD_SIZE, bitsize);
                          }
                          if (!bitsize) {
                            (yyval.sym) = newSymbol (genSymName(NestLevel),NestLevel) ;
                            (yyval.sym)->bitVar = BITVAR_PAD;
                            werror(W_BITFLD_NAMED);
                          }
                          else
                            (yyvsp[(1) - (3)].sym)->bitVar = bitsize;
                        }
    break;

  case 175:

/* Line 1806 of yacc.c  */
#line 915 "SDCC.y"
    { (yyval.sym) = newSymbol ("", NestLevel) ; }
    break;

  case 176:

/* Line 1806 of yacc.c  */
#line 920 "SDCC.y"
    {
           (yyval.lnk) = newEnumType ((yyvsp[(3) - (4)].sym));       //copyLinkChain(cenum->type);
           SPEC_SCLS(getSpec((yyval.lnk))) = 0;
         }
    break;

  case 177:

/* Line 1806 of yacc.c  */
#line 925 "SDCC.y"
    {
     symbol *csym ;
     sym_link *enumtype;

     csym=findSym(enumTab,(yyvsp[(2) - (5)].sym),(yyvsp[(2) - (5)].sym)->name);
     if ((csym && csym->level == (yyvsp[(2) - (5)].sym)->level))
       {
         werrorfl((yyvsp[(2) - (5)].sym)->fileDef, (yyvsp[(2) - (5)].sym)->lineDef, E_DUPLICATE_TYPEDEF,csym->name);
         werrorfl(csym->fileDef, csym->lineDef, E_PREVIOUS_DEF);
       }

     enumtype = newEnumType ((yyvsp[(4) - (5)].sym));       //copyLinkChain(cenum->type);
     SPEC_SCLS(getSpec(enumtype)) = 0;
     (yyvsp[(2) - (5)].sym)->type = enumtype;

     /* add this to the enumerator table */
     if (!csym)
       addSym ( enumTab,(yyvsp[(2) - (5)].sym),(yyvsp[(2) - (5)].sym)->name,(yyvsp[(2) - (5)].sym)->level,(yyvsp[(2) - (5)].sym)->block, 0);
     (yyval.lnk) = copyLinkChain(enumtype);
   }
    break;

  case 178:

/* Line 1806 of yacc.c  */
#line 945 "SDCC.y"
    {
     symbol *csym ;

     /* check the enumerator table */
     if ((csym = findSym(enumTab,(yyvsp[(2) - (2)].sym),(yyvsp[(2) - (2)].sym)->name)))
       (yyval.lnk) = copyLinkChain(csym->type);
     else  {
       (yyval.lnk) = newLink(SPECIFIER) ;
       SPEC_NOUN((yyval.lnk)) = V_INT   ;
     }
   }
    break;

  case 181:

/* Line 1806 of yacc.c  */
#line 962 "SDCC.y"
    {
        (yyvsp[(3) - (3)].sym)->next = (yyvsp[(1) - (3)].sym) ;
        (yyval.sym) = (yyvsp[(3) - (3)].sym)  ;
      }
    break;

  case 182:

/* Line 1806 of yacc.c  */
#line 970 "SDCC.y"
    {
        symbol *sym;

        /* make the symbol one level up */
        (yyvsp[(1) - (2)].sym)->level-- ;
        // check if the symbol at the same level already exists
        if ((sym = findSymWithLevel (SymbolTab, (yyvsp[(1) - (2)].sym))) &&
          sym->level == (yyvsp[(1) - (2)].sym)->level)
          {
            werrorfl ((yyvsp[(1) - (2)].sym)->fileDef, (yyvsp[(1) - (2)].sym)->lineDef, E_DUPLICATE_MEMBER, "enum", (yyvsp[(1) - (2)].sym)->name);
            werrorfl (sym->fileDef, sym->lineDef, E_PREVIOUS_DEF);
          }
        (yyvsp[(1) - (2)].sym)->type = copyLinkChain ((yyvsp[(2) - (2)].val)->type);
        (yyvsp[(1) - (2)].sym)->etype= getSpec ((yyvsp[(1) - (2)].sym)->type);
        SPEC_ENUM ((yyvsp[(1) - (2)].sym)->etype) = 1;
        (yyval.sym) = (yyvsp[(1) - (2)].sym) ;
        // do this now, so we can use it for the next enums in the list
        addSymChain (&(yyvsp[(1) - (2)].sym));
      }
    break;

  case 183:

/* Line 1806 of yacc.c  */
#line 992 "SDCC.y"
    {
                              value *val ;

                              val = constExprValue((yyvsp[(2) - (2)].asts),TRUE);
                              if (!IS_INT(val->type) && !IS_CHAR(val->type))
                                {
                                  werror(E_ENUM_NON_INTEGER);
                                  SNPRINTF(lbuff, sizeof(lbuff),
                                          "%d", (int) ulFromVal(val));
                                  val = constVal(lbuff);
                                }
                              (yyval.val) = cenum = val ;
                           }
    break;

  case 184:

/* Line 1806 of yacc.c  */
#line 1005 "SDCC.y"
    {
                              if (cenum)  {
                                 SNPRINTF(lbuff, sizeof(lbuff),
                                          "%d", (int) ulFromVal(cenum)+1);
                                 (yyval.val) = cenum = constVal(lbuff);
                              }
                              else {
                                 (yyval.val) = cenum = constCharVal(0);
                              }
                           }
    break;

  case 185:

/* Line 1806 of yacc.c  */
#line 1018 "SDCC.y"
    { (yyval.sym) = (yyvsp[(1) - (1)].sym) ; }
    break;

  case 186:

/* Line 1806 of yacc.c  */
#line 1020 "SDCC.y"
    {
             addDecl ((yyvsp[(2) - (2)].sym),0,reverseLink((yyvsp[(1) - (2)].lnk)));
             (yyval.sym) = (yyvsp[(2) - (2)].sym) ;
         }
    break;

  case 187:

/* Line 1806 of yacc.c  */
#line 1027 "SDCC.y"
    { (yyval.sym) = (yyvsp[(1) - (1)].sym) ; }
    break;

  case 188:

/* Line 1806 of yacc.c  */
#line 1028 "SDCC.y"
    { (yyval.sym) = (yyvsp[(1) - (1)].sym) ; }
    break;

  case 189:

/* Line 1806 of yacc.c  */
#line 1032 "SDCC.y"
    { (yyval.sym) = (yyvsp[(1) - (1)].sym); }
    break;

  case 190:

/* Line 1806 of yacc.c  */
#line 1034 "SDCC.y"
    {
             addDecl ((yyvsp[(2) - (2)].sym),0,reverseLink((yyvsp[(1) - (2)].lnk)));
             (yyval.sym) = (yyvsp[(2) - (2)].sym) ;
         }
    break;

  case 191:

/* Line 1806 of yacc.c  */
#line 1041 "SDCC.y"
    { (yyval.sym) = (yyvsp[(1) - (1)].sym) ; }
    break;

  case 192:

/* Line 1806 of yacc.c  */
#line 1042 "SDCC.y"
    {
           // copy the functionAttributes (not the args and hasVargs !!)
           struct value *args;
           unsigned hasVargs;
           sym_link *funcType=(yyvsp[(1) - (2)].sym)->type;

           while (funcType && !IS_FUNC(funcType))
             funcType = funcType->next;

           if (!funcType)
             werror (E_FUNC_ATTR);
           else
             {
               args=FUNC_ARGS(funcType);
               hasVargs=FUNC_HASVARARGS(funcType);

               memcpy (&funcType->funcAttrs, &(yyvsp[(2) - (2)].lnk)->funcAttrs,
                   sizeof((yyvsp[(2) - (2)].lnk)->funcAttrs));

               FUNC_ARGS(funcType)=args;
               FUNC_HASVARARGS(funcType)=hasVargs;

               // just to be sure
               memset (&(yyvsp[(2) - (2)].lnk)->funcAttrs, 0,
                   sizeof((yyvsp[(2) - (2)].lnk)->funcAttrs));

               addDecl ((yyvsp[(1) - (2)].sym),0,(yyvsp[(2) - (2)].lnk));
             }
   }
    break;

  case 194:

/* Line 1806 of yacc.c  */
#line 1075 "SDCC.y"
    { (yyval.sym) = (yyvsp[(2) - (3)].sym); }
    break;

  case 195:

/* Line 1806 of yacc.c  */
#line 1077 "SDCC.y"
    {
            sym_link   *p;

            p = newLink (DECLARATOR);
            DCL_TYPE(p) = ARRAY ;
            DCL_ELEM(p) = 0     ;
            addDecl((yyvsp[(1) - (3)].sym),0,p);
         }
    break;

  case 196:

/* Line 1806 of yacc.c  */
#line 1086 "SDCC.y"
    {
            sym_link *p;
            value *tval;
            int size;

            tval = constExprValue((yyvsp[(3) - (4)].asts), TRUE);
            /* if it is not a constant then Error  */
            p = newLink (DECLARATOR);
            DCL_TYPE(p) = ARRAY;

            if (!tval || (SPEC_SCLS(tval->etype) != S_LITERAL))
              {
                werror(E_CONST_EXPECTED);
                /* Assume a single item array to limit the cascade */
                /* of additional errors. */
                size = 1;
              }
            else
              {
                if ((size = (int) ulFromVal(tval)) < 0)
                  {
                    werror(E_NEGATIVE_ARRAY_SIZE, (yyvsp[(1) - (4)].sym)->name);
                    size = 1;
                  }
              }
            DCL_ELEM(p) = size;
            addDecl((yyvsp[(1) - (4)].sym), 0, p);
         }
    break;

  case 197:

/* Line 1806 of yacc.c  */
#line 1117 "SDCC.y"
    {  addDecl ((yyvsp[(1) - (3)].sym),FUNCTION,NULL) ;   }
    break;

  case 198:

/* Line 1806 of yacc.c  */
#line 1118 "SDCC.y"
    { NestLevel++ ; currBlockno++;  }
    break;

  case 199:

/* Line 1806 of yacc.c  */
#line 1120 "SDCC.y"
    {
             sym_link *funcType;

             addDecl ((yyvsp[(1) - (5)].sym),FUNCTION,NULL) ;

             funcType = (yyvsp[(1) - (5)].sym)->type;
             while (funcType && !IS_FUNC(funcType))
               funcType = funcType->next;

             assert (funcType);

             FUNC_HASVARARGS(funcType) = IS_VARG((yyvsp[(4) - (5)].val));
             FUNC_ARGS(funcType) = reverseVal((yyvsp[(4) - (5)].val));

             /* nest level was incremented to take care of the parms  */
             NestLevel-- ;
             currBlockno--;

             // if this was a pointer (to a function)
             if (!IS_FUNC((yyvsp[(1) - (5)].sym)->type))
               cleanUpLevel(SymbolTab,NestLevel+1);

             (yyval.sym) = (yyvsp[(1) - (5)].sym);
         }
    break;

  case 200:

/* Line 1806 of yacc.c  */
#line 1145 "SDCC.y"
    {
           werror(E_OLD_STYLE,(yyvsp[(1) - (4)].sym)->name) ;
           /* assume it returns an int */
           (yyvsp[(1) - (4)].sym)->type = (yyvsp[(1) - (4)].sym)->etype = newIntLink();
           (yyval.sym) = (yyvsp[(1) - (4)].sym) ;
         }
    break;

  case 201:

/* Line 1806 of yacc.c  */
#line 1154 "SDCC.y"
    { (yyval.lnk) = (yyvsp[(1) - (1)].lnk) ;}
    break;

  case 202:

/* Line 1806 of yacc.c  */
#line 1156 "SDCC.y"
    {
             (yyval.lnk) = (yyvsp[(1) - (2)].lnk)  ;
             if (IS_SPEC((yyvsp[(2) - (2)].lnk))) {
                 DCL_TSPEC((yyvsp[(1) - (2)].lnk)) = (yyvsp[(2) - (2)].lnk);
                 DCL_PTR_CONST((yyvsp[(1) - (2)].lnk)) = SPEC_CONST((yyvsp[(2) - (2)].lnk));
                 DCL_PTR_VOLATILE((yyvsp[(1) - (2)].lnk)) = SPEC_VOLATILE((yyvsp[(2) - (2)].lnk));
                 DCL_PTR_RESTRICT((yyvsp[(1) - (2)].lnk)) = SPEC_RESTRICT((yyvsp[(2) - (2)].lnk));
             }
             else
                 werror (W_PTR_TYPE_INVALID);
         }
    break;

  case 203:

/* Line 1806 of yacc.c  */
#line 1168 "SDCC.y"
    {
             (yyval.lnk) = (yyvsp[(1) - (2)].lnk) ;
             (yyval.lnk)->next = (yyvsp[(2) - (2)].lnk) ;
             DCL_TYPE((yyvsp[(2) - (2)].lnk))=port->unqualified_pointer;
         }
    break;

  case 204:

/* Line 1806 of yacc.c  */
#line 1174 "SDCC.y"
    {
             (yyval.lnk) = (yyvsp[(1) - (3)].lnk) ;
             if (IS_SPEC((yyvsp[(2) - (3)].lnk)) && DCL_TYPE((yyvsp[(3) - (3)].lnk)) == UPOINTER) {
                 DCL_PTR_CONST((yyvsp[(1) - (3)].lnk)) = SPEC_CONST((yyvsp[(2) - (3)].lnk));
                 DCL_PTR_VOLATILE((yyvsp[(1) - (3)].lnk)) = SPEC_VOLATILE((yyvsp[(2) - (3)].lnk));
                 DCL_PTR_RESTRICT((yyvsp[(1) - (3)].lnk)) = SPEC_RESTRICT((yyvsp[(2) - (3)].lnk));
                 switch (SPEC_SCLS((yyvsp[(2) - (3)].lnk))) {
                 case S_XDATA:
                     DCL_TYPE((yyvsp[(3) - (3)].lnk)) = FPOINTER;
                     break;
                 case S_IDATA:
                     DCL_TYPE((yyvsp[(3) - (3)].lnk)) = IPOINTER ;
                     break;
                 case S_PDATA:
                     DCL_TYPE((yyvsp[(3) - (3)].lnk)) = PPOINTER ;
                     break;
                 case S_DATA:
                     DCL_TYPE((yyvsp[(3) - (3)].lnk)) = POINTER ;
                     break;
                 case S_CODE:
                     DCL_TYPE((yyvsp[(3) - (3)].lnk)) = CPOINTER ;
                     break;
                 case S_EEPROM:
                     DCL_TYPE((yyvsp[(3) - (3)].lnk)) = EEPPOINTER;
                     break;
                 default:
                   // this could be just "constant"
                   // werror(W_PTR_TYPE_INVALID);
                     ;
                 }
             }
             else
                 werror (W_PTR_TYPE_INVALID);
             (yyval.lnk)->next = (yyvsp[(3) - (3)].lnk) ;
         }
    break;

  case 205:

/* Line 1806 of yacc.c  */
#line 1213 "SDCC.y"
    {
        (yyval.lnk) = newLink(DECLARATOR);
        DCL_TYPE((yyval.lnk))=UPOINTER;
      }
    break;

  case 206:

/* Line 1806 of yacc.c  */
#line 1219 "SDCC.y"
    { (yyval.lnk) = finalizeSpec((yyvsp[(1) - (1)].lnk)); }
    break;

  case 208:

/* Line 1806 of yacc.c  */
#line 1224 "SDCC.y"
    {
     /* if the decl $2 is not a specifier */
     /* find the spec and replace it      */
     (yyval.lnk) = mergeDeclSpec((yyvsp[(1) - (2)].lnk), (yyvsp[(2) - (2)].lnk), "type_specifier_list type_specifier skipped");
   }
    break;

  case 210:

/* Line 1806 of yacc.c  */
#line 1234 "SDCC.y"
    {
           (yyvsp[(3) - (3)].sym)->next = (yyvsp[(1) - (3)].sym);
           (yyval.sym) = (yyvsp[(3) - (3)].sym) ;
         }
    break;

  case 212:

/* Line 1806 of yacc.c  */
#line 1242 "SDCC.y"
    { (yyvsp[(1) - (3)].val)->vArgs = 1;}
    break;

  case 214:

/* Line 1806 of yacc.c  */
#line 1248 "SDCC.y"
    {
            (yyvsp[(3) - (3)].val)->next = (yyvsp[(1) - (3)].val) ;
            (yyval.val) = (yyvsp[(3) - (3)].val) ;
         }
    break;

  case 215:

/* Line 1806 of yacc.c  */
#line 1256 "SDCC.y"
    {
                  symbol *loop ;
                  pointerTypes((yyvsp[(2) - (2)].sym)->type,(yyvsp[(1) - (2)].lnk));
                  addDecl ((yyvsp[(2) - (2)].sym),0,(yyvsp[(1) - (2)].lnk));
                  for (loop=(yyvsp[(2) - (2)].sym);loop;loop->_isparm=1,loop=loop->next);
                  addSymChain (&(yyvsp[(2) - (2)].sym));
                  (yyval.val) = symbolVal((yyvsp[(2) - (2)].sym));
                  ignoreTypedefType = 0;
               }
    break;

  case 216:

/* Line 1806 of yacc.c  */
#line 1265 "SDCC.y"
    {
                  (yyval.val) = newValue() ;
                  (yyval.val)->type = (yyvsp[(1) - (1)].lnk);
                  (yyval.val)->etype = getSpec((yyval.val)->type);
                  ignoreTypedefType = 0;
               }
    break;

  case 217:

/* Line 1806 of yacc.c  */
#line 1274 "SDCC.y"
    { (yyval.lnk) = (yyvsp[(1) - (1)].lnk); ignoreTypedefType = 0;}
    break;

  case 218:

/* Line 1806 of yacc.c  */
#line 1276 "SDCC.y"
    {
                 /* go to the end of the list */
                 sym_link *p;
                 pointerTypes((yyvsp[(2) - (2)].lnk),(yyvsp[(1) - (2)].lnk));
                 for ( p = (yyvsp[(2) - (2)].lnk) ; p && p->next ; p=p->next);
                 if (!p) {
                   werror(E_SYNTAX_ERROR, yytext);
                 } else {
                   p->next = (yyvsp[(1) - (2)].lnk) ;
                 }
                 (yyval.lnk) = (yyvsp[(2) - (2)].lnk) ;
                 ignoreTypedefType = 0;
               }
    break;

  case 219:

/* Line 1806 of yacc.c  */
#line 1292 "SDCC.y"
    { (yyval.lnk) = reverseLink((yyvsp[(1) - (1)].lnk)); }
    break;

  case 221:

/* Line 1806 of yacc.c  */
#line 1294 "SDCC.y"
    { (yyvsp[(1) - (2)].lnk) = reverseLink((yyvsp[(1) - (2)].lnk)); (yyvsp[(1) - (2)].lnk)->next = (yyvsp[(2) - (2)].lnk) ; (yyval.lnk) = (yyvsp[(1) - (2)].lnk);
          if (IS_PTR((yyvsp[(1) - (2)].lnk)) && IS_FUNC((yyvsp[(2) - (2)].lnk)))
            DCL_TYPE((yyvsp[(1) - (2)].lnk)) = CPOINTER;
        }
    break;

  case 222:

/* Line 1806 of yacc.c  */
#line 1301 "SDCC.y"
    { (yyval.lnk) = (yyvsp[(2) - (3)].lnk) ; }
    break;

  case 223:

/* Line 1806 of yacc.c  */
#line 1302 "SDCC.y"
    {
                                       (yyval.lnk) = newLink (DECLARATOR);
                                       DCL_TYPE((yyval.lnk)) = ARRAY ;
                                       DCL_ELEM((yyval.lnk)) = 0     ;
                                    }
    break;

  case 224:

/* Line 1806 of yacc.c  */
#line 1307 "SDCC.y"
    {
                                       value *val ;
                                       (yyval.lnk) = newLink (DECLARATOR);
                                       DCL_TYPE((yyval.lnk)) = ARRAY ;
                                       DCL_ELEM((yyval.lnk)) = (int) ulFromVal(val = constExprValue((yyvsp[(2) - (3)].asts),TRUE));
                                    }
    break;

  case 225:

/* Line 1806 of yacc.c  */
#line 1313 "SDCC.y"
    {
                                       (yyval.lnk) = newLink (DECLARATOR);
                                       DCL_TYPE((yyval.lnk)) = ARRAY ;
                                       DCL_ELEM((yyval.lnk)) = 0     ;
                                       (yyval.lnk)->next = (yyvsp[(1) - (3)].lnk) ;
                                    }
    break;

  case 226:

/* Line 1806 of yacc.c  */
#line 1320 "SDCC.y"
    {
                                       value *val ;
                                       (yyval.lnk) = newLink (DECLARATOR);
                                       DCL_TYPE((yyval.lnk)) = ARRAY ;
                                       DCL_ELEM((yyval.lnk)) = (int) ulFromVal(val = constExprValue((yyvsp[(3) - (4)].asts),TRUE));
                                       (yyval.lnk)->next = (yyvsp[(1) - (4)].lnk) ;
                                    }
    break;

  case 227:

/* Line 1806 of yacc.c  */
#line 1327 "SDCC.y"
    { (yyval.lnk) = NULL;}
    break;

  case 228:

/* Line 1806 of yacc.c  */
#line 1328 "SDCC.y"
    { (yyval.lnk) = NULL;}
    break;

  case 229:

/* Line 1806 of yacc.c  */
#line 1329 "SDCC.y"
    {
     // $1 must be a pointer to a function
     sym_link *p=newLink(DECLARATOR);
     DCL_TYPE(p) = FUNCTION;
     if (!(yyvsp[(1) - (3)].lnk)) {
       // ((void (code *) ()) 0) ()
       (yyvsp[(1) - (3)].lnk)=newLink(DECLARATOR);
       DCL_TYPE((yyvsp[(1) - (3)].lnk))=CPOINTER;
       (yyval.lnk) = (yyvsp[(1) - (3)].lnk);
     }
     (yyvsp[(1) - (3)].lnk)->next=p;
   }
    break;

  case 230:

/* Line 1806 of yacc.c  */
#line 1341 "SDCC.y"
    { NestLevel++ ; currBlockno++; }
    break;

  case 231:

/* Line 1806 of yacc.c  */
#line 1341 "SDCC.y"
    {
       sym_link *p=newLink(DECLARATOR);
       DCL_TYPE(p) = FUNCTION;

       FUNC_HASVARARGS(p) = IS_VARG((yyvsp[(4) - (5)].val));
       FUNC_ARGS(p) = reverseVal((yyvsp[(4) - (5)].val));

       /* nest level was incremented to take care of the parms  */
       NestLevel-- ;
       currBlockno--;
       if (!(yyvsp[(1) - (5)].lnk)) {
         /* ((void (code *) (void)) 0) () */
         (yyvsp[(1) - (5)].lnk)=newLink(DECLARATOR);
         DCL_TYPE((yyvsp[(1) - (5)].lnk))=CPOINTER;
         (yyval.lnk) = (yyvsp[(1) - (5)].lnk);
       }
       (yyvsp[(1) - (5)].lnk)->next=p;

       // remove the symbol args (if any)
       cleanUpLevel(SymbolTab,NestLevel+1);
   }
    break;

  case 232:

/* Line 1806 of yacc.c  */
#line 1365 "SDCC.y"
    { (yyval.ilist) = newiList(INIT_NODE,(yyvsp[(1) - (1)].asts)); }
    break;

  case 233:

/* Line 1806 of yacc.c  */
#line 1366 "SDCC.y"
    { (yyval.ilist) = newiList(INIT_DEEP,revinit((yyvsp[(2) - (3)].ilist))); }
    break;

  case 234:

/* Line 1806 of yacc.c  */
#line 1367 "SDCC.y"
    { (yyval.ilist) = newiList(INIT_DEEP,revinit((yyvsp[(2) - (4)].ilist))); }
    break;

  case 236:

/* Line 1806 of yacc.c  */
#line 1372 "SDCC.y"
    {  (yyvsp[(3) - (3)].ilist)->next = (yyvsp[(1) - (3)].ilist); (yyval.ilist) = (yyvsp[(3) - (3)].ilist); }
    break;

  case 244:

/* Line 1806 of yacc.c  */
#line 1383 "SDCC.y"
    {
                            ast *ex;
                            seqPointNo++;
                            ex = newNode(INLINEASM,NULL,NULL);
                            ex->values.inlineasm = strdup((yyvsp[(1) - (2)].yyinline));
                            seqPointNo++;
                            (yyval.asts) = ex;
                         }
    break;

  case 245:

/* Line 1806 of yacc.c  */
#line 1394 "SDCC.y"
    {
                   inCritical++;
                   STACK_PUSH(continueStack,NULL);
                   STACK_PUSH(breakStack,NULL);
                   (yyval.sym) = NULL;
                }
    break;

  case 246:

/* Line 1806 of yacc.c  */
#line 1403 "SDCC.y"
    {
                   STACK_POP(breakStack);
                   STACK_POP(continueStack);
                   inCritical--;
                   (yyval.asts) = newNode(CRITICAL,(yyvsp[(2) - (2)].asts),NULL);
                }
    break;

  case 247:

/* Line 1806 of yacc.c  */
#line 1413 "SDCC.y"
    {  (yyval.asts) = createLabel((yyvsp[(1) - (2)].sym),NULL);
                                          (yyvsp[(1) - (2)].sym)->isitmp = 0;  }
    break;

  case 248:

/* Line 1806 of yacc.c  */
#line 1416 "SDCC.y"
    {
       if (STACK_EMPTY(swStk))
         (yyval.asts) = createCase(NULL,(yyvsp[(2) - (3)].asts),NULL);
       else
         (yyval.asts) = createCase(STACK_PEEK(swStk),(yyvsp[(2) - (3)].asts),NULL);
     }
    break;

  case 249:

/* Line 1806 of yacc.c  */
#line 1422 "SDCC.y"
    { (yyval.asts) = newNode(DEFAULT,NULL,NULL); }
    break;

  case 250:

/* Line 1806 of yacc.c  */
#line 1423 "SDCC.y"
    {
       if (STACK_EMPTY(swStk))
         (yyval.asts) = createDefault(NULL,(yyvsp[(2) - (3)].asts),NULL);
       else
         (yyval.asts) = createDefault(STACK_PEEK(swStk),(yyvsp[(2) - (3)].asts),NULL);
     }
    break;

  case 251:

/* Line 1806 of yacc.c  */
#line 1432 "SDCC.y"
    {
                STACK_PUSH(blockNum,currBlockno);
                currBlockno = ++blockNo ;
                ignoreTypedefType = 0;
              }
    break;

  case 252:

/* Line 1806 of yacc.c  */
#line 1439 "SDCC.y"
    { currBlockno = STACK_POP(blockNum); }
    break;

  case 253:

/* Line 1806 of yacc.c  */
#line 1443 "SDCC.y"
    { (yyval.asts) = createBlock(NULL, NULL); }
    break;

  case 254:

/* Line 1806 of yacc.c  */
#line 1444 "SDCC.y"
    { (yyval.asts) = createBlock(NULL, (yyvsp[(2) - (3)].asts)); }
    break;

  case 255:

/* Line 1806 of yacc.c  */
#line 1445 "SDCC.y"
    { (yyval.asts) = createBlock((yyvsp[(2) - (3)].sym), NULL); }
    break;

  case 256:

/* Line 1806 of yacc.c  */
#line 1448 "SDCC.y"
    {(yyval.asts) = createBlock((yyvsp[(2) - (4)].sym), (yyvsp[(3) - (4)].asts)); }
    break;

  case 257:

/* Line 1806 of yacc.c  */
#line 1449 "SDCC.y"
    { (yyval.asts) = NULL ; }
    break;

  case 258:

/* Line 1806 of yacc.c  */
#line 1454 "SDCC.y"
    {
       /* if this is typedef declare it immediately */
       if ( (yyvsp[(1) - (1)].sym) && IS_TYPEDEF((yyvsp[(1) - (1)].sym)->etype)) {
         allocVariables ((yyvsp[(1) - (1)].sym));
         (yyval.sym) = NULL ;
       }
       else
         (yyval.sym) = (yyvsp[(1) - (1)].sym) ;
       ignoreTypedefType = 0;
       addSymChain(&(yyvsp[(1) - (1)].sym));
     }
    break;

  case 259:

/* Line 1806 of yacc.c  */
#line 1467 "SDCC.y"
    {
       symbol   *sym;

       /* if this is a typedef */
       if ((yyvsp[(2) - (2)].sym) && IS_TYPEDEF((yyvsp[(2) - (2)].sym)->etype)) {
         allocVariables ((yyvsp[(2) - (2)].sym));
         (yyval.sym) = (yyvsp[(1) - (2)].sym) ;
       }
       else {
         /* get to the end of the previous decl */
         if ( (yyvsp[(1) - (2)].sym) ) {
           (yyval.sym) = sym = (yyvsp[(1) - (2)].sym) ;
           while (sym->next)
             sym = sym->next ;
           sym->next = (yyvsp[(2) - (2)].sym);
         }
         else
           (yyval.sym) = (yyvsp[(2) - (2)].sym) ;
       }
       ignoreTypedefType = 0;
       addSymChain(&(yyvsp[(2) - (2)].sym));
     }
    break;

  case 261:

/* Line 1806 of yacc.c  */
#line 1493 "SDCC.y"
    {  (yyval.asts) = newNode(NULLOP,(yyvsp[(1) - (2)].asts),(yyvsp[(2) - (2)].asts)) ;}
    break;

  case 262:

/* Line 1806 of yacc.c  */
#line 1497 "SDCC.y"
    { (yyval.asts) = NULL;}
    break;

  case 263:

/* Line 1806 of yacc.c  */
#line 1498 "SDCC.y"
    { (yyval.asts) = (yyvsp[(1) - (2)].asts); seqPointNo++;}
    break;

  case 264:

/* Line 1806 of yacc.c  */
#line 1502 "SDCC.y"
    { (yyval.asts) = (yyvsp[(2) - (2)].asts)  ; }
    break;

  case 265:

/* Line 1806 of yacc.c  */
#line 1503 "SDCC.y"
    { (yyval.asts) = NULL;}
    break;

  case 266:

/* Line 1806 of yacc.c  */
#line 1508 "SDCC.y"
    { seqPointNo++;}
    break;

  case 267:

/* Line 1806 of yacc.c  */
#line 1509 "SDCC.y"
    {
                              noLineno++ ;
                              (yyval.asts) = createIf ((yyvsp[(3) - (7)].asts), (yyvsp[(6) - (7)].asts), (yyvsp[(7) - (7)].asts) );
                              (yyval.asts)->lineno = (yyvsp[(3) - (7)].asts)->lineno;
                              (yyval.asts)->filename = (yyvsp[(3) - (7)].asts)->filename;
                              noLineno--;
                           }
    break;

  case 268:

/* Line 1806 of yacc.c  */
#line 1516 "SDCC.y"
    {
                              ast *ex ;
                              static   int swLabel = 0 ;

                              seqPointNo++;
                              /* create a node for expression  */
                              ex = newNode(SWITCH,(yyvsp[(3) - (4)].asts),NULL);
                              STACK_PUSH(swStk,ex);   /* save it in the stack */
                              ex->values.switchVals.swNum = swLabel ;

                              /* now create the label */
                              SNPRINTF(lbuff, sizeof(lbuff),
                                       "_swBrk_%d",swLabel++);
                              (yyval.sym)  =  newSymbol(lbuff,NestLevel);
                              /* put label in the break stack  */
                              STACK_PUSH(breakStack,(yyval.sym));
                           }
    break;

  case 269:

/* Line 1806 of yacc.c  */
#line 1533 "SDCC.y"
    {
                              /* get back the switch form the stack  */
                              (yyval.asts) = STACK_POP(swStk)  ;
                              (yyval.asts)->right = newNode (NULLOP,(yyvsp[(6) - (6)].asts),createLabel((yyvsp[(5) - (6)].sym),NULL));
                              STACK_POP(breakStack);
                           }
    break;

  case 270:

/* Line 1806 of yacc.c  */
#line 1541 "SDCC.y"
    {  /* create and push the continue , break & body labels */
                  static int Lblnum = 0 ;
                  /* continue */
                  SNPRINTF (lbuff, sizeof(lbuff), "_whilecontinue_%d",Lblnum);
                  STACK_PUSH(continueStack,newSymbol(lbuff,NestLevel));
                  /* break */
                  SNPRINTF (lbuff, sizeof(lbuff), "_whilebreak_%d",Lblnum);
                  STACK_PUSH(breakStack,newSymbol(lbuff,NestLevel));
                  /* body */
                  SNPRINTF (lbuff, sizeof(lbuff), "_whilebody_%d",Lblnum++);
                  (yyval.sym) = newSymbol(lbuff,NestLevel);
               }
    break;

  case 271:

/* Line 1806 of yacc.c  */
#line 1555 "SDCC.y"
    {  /* create and push the continue , break & body Labels */
           static int Lblnum = 0 ;

           /* continue */
           SNPRINTF(lbuff, sizeof(lbuff), "_docontinue_%d",Lblnum);
           STACK_PUSH(continueStack,newSymbol(lbuff,NestLevel));
           /* break */
           SNPRINTF(lbuff, sizeof(lbuff), "_dobreak_%d",Lblnum);
           STACK_PUSH(breakStack,newSymbol(lbuff,NestLevel));
           /* do body */
           SNPRINTF(lbuff, sizeof(lbuff), "_dobody_%d",Lblnum++);
           (yyval.sym) = newSymbol (lbuff,NestLevel);
        }
    break;

  case 272:

/* Line 1806 of yacc.c  */
#line 1570 "SDCC.y"
    { /* create & push continue, break & body labels */
            static int Lblnum = 0 ;

            /* continue */
            SNPRINTF(lbuff, sizeof(lbuff), "_forcontinue_%d",Lblnum);
            STACK_PUSH(continueStack,newSymbol(lbuff,NestLevel));
            /* break    */
            SNPRINTF(lbuff, sizeof(lbuff), "_forbreak_%d",Lblnum);
            STACK_PUSH(breakStack,newSymbol(lbuff,NestLevel));
            /* body */
            SNPRINTF(lbuff, sizeof(lbuff), "_forbody_%d",Lblnum);
            (yyval.sym) = newSymbol(lbuff,NestLevel);
            /* condition */
            SNPRINTF(lbuff, sizeof(lbuff), "_forcond_%d",Lblnum++);
            STACK_PUSH(forStack,newSymbol(lbuff,NestLevel));
          }
    break;

  case 273:

/* Line 1806 of yacc.c  */
#line 1589 "SDCC.y"
    { seqPointNo++;}
    break;

  case 274:

/* Line 1806 of yacc.c  */
#line 1590 "SDCC.y"
    {
                           noLineno++ ;
                           (yyval.asts) = createWhile ( (yyvsp[(1) - (6)].sym), STACK_POP(continueStack),
                                              STACK_POP(breakStack), (yyvsp[(3) - (6)].asts), (yyvsp[(6) - (6)].asts) );
                           (yyval.asts)->lineno = (yyvsp[(1) - (6)].sym)->lineDef;
                           (yyval.asts)->filename = (yyvsp[(1) - (6)].sym)->fileDef;
                           noLineno-- ;
                         }
    break;

  case 275:

/* Line 1806 of yacc.c  */
#line 1599 "SDCC.y"
    {
                          seqPointNo++;
                          noLineno++ ;
                          (yyval.asts) = createDo ( (yyvsp[(1) - (7)].sym) , STACK_POP(continueStack),
                                          STACK_POP(breakStack), (yyvsp[(5) - (7)].asts), (yyvsp[(2) - (7)].asts));
                          (yyval.asts)->lineno = (yyvsp[(1) - (7)].sym)->lineDef;
                          (yyval.asts)->filename = (yyvsp[(1) - (7)].sym)->fileDef;
                          noLineno-- ;
                        }
    break;

  case 276:

/* Line 1806 of yacc.c  */
#line 1609 "SDCC.y"
    {
                          noLineno++ ;

                          /* if break or continue statement present
                             then create a general case loop */
                          if (STACK_PEEK(continueStack)->isref ||
                              STACK_PEEK(breakStack)->isref) {
                              (yyval.asts) = createFor ((yyvsp[(1) - (9)].sym), STACK_POP(continueStack),
                                              STACK_POP(breakStack) ,
                                              STACK_POP(forStack)   ,
                                              (yyvsp[(3) - (9)].asts) , (yyvsp[(5) - (9)].asts) , (yyvsp[(7) - (9)].asts), (yyvsp[(9) - (9)].asts) );
                          } else {
                              (yyval.asts) = newNode(FOR,(yyvsp[(9) - (9)].asts),NULL);
                              AST_FOR((yyval.asts),trueLabel) = (yyvsp[(1) - (9)].sym);
                              AST_FOR((yyval.asts),continueLabel) =  STACK_POP(continueStack);
                              AST_FOR((yyval.asts),falseLabel) = STACK_POP(breakStack);
                              AST_FOR((yyval.asts),condLabel)  = STACK_POP(forStack)  ;
                              AST_FOR((yyval.asts),initExpr)   = (yyvsp[(3) - (9)].asts);
                              AST_FOR((yyval.asts),condExpr)   = (yyvsp[(5) - (9)].asts);
                              AST_FOR((yyval.asts),loopExpr)   = (yyvsp[(7) - (9)].asts);
                          }

                          noLineno-- ;
                        }
    break;

  case 277:

/* Line 1806 of yacc.c  */
#line 1636 "SDCC.y"
    { (yyval.asts) = NULL ; seqPointNo++; }
    break;

  case 278:

/* Line 1806 of yacc.c  */
#line 1637 "SDCC.y"
    { (yyval.asts) = (yyvsp[(1) - (1)].asts) ; seqPointNo++; }
    break;

  case 279:

/* Line 1806 of yacc.c  */
#line 1641 "SDCC.y"
    {
                              (yyvsp[(2) - (3)].sym)->islbl = 1;
                              (yyval.asts) = newAst_VALUE(symbolVal((yyvsp[(2) - (3)].sym)));
                              (yyval.asts) = newNode(GOTO,(yyval.asts),NULL);
                           }
    break;

  case 280:

/* Line 1806 of yacc.c  */
#line 1646 "SDCC.y"
    {
       /* make sure continue is in context */
       if (STACK_EMPTY(continueStack) || STACK_PEEK(continueStack) == NULL) {
           werror(E_BREAK_CONTEXT);
           (yyval.asts) = NULL;
       }
       else {
           (yyval.asts) = newAst_VALUE(symbolVal(STACK_PEEK(continueStack)));
           (yyval.asts) = newNode(GOTO,(yyval.asts),NULL);
           /* mark the continue label as referenced */
           STACK_PEEK(continueStack)->isref = 1;
       }
   }
    break;

  case 281:

/* Line 1806 of yacc.c  */
#line 1659 "SDCC.y"
    {
       if (STACK_EMPTY(breakStack) || STACK_PEEK(breakStack) == NULL) {
           werror(E_BREAK_CONTEXT);
           (yyval.asts) = NULL;
       } else {
           (yyval.asts) = newAst_VALUE(symbolVal(STACK_PEEK(breakStack)));
           (yyval.asts) = newNode(GOTO,(yyval.asts),NULL);
           STACK_PEEK(breakStack)->isref = 1;
       }
   }
    break;

  case 282:

/* Line 1806 of yacc.c  */
#line 1669 "SDCC.y"
    {
       seqPointNo++;
       if (inCritical) {
           werror(E_INVALID_CRITICAL);
           (yyval.asts) = NULL;
       } else {
           (yyval.asts) = newNode(RETURN,NULL,NULL);
       }
   }
    break;

  case 283:

/* Line 1806 of yacc.c  */
#line 1678 "SDCC.y"
    {
       seqPointNo++;
       if (inCritical) {
           werror(E_INVALID_CRITICAL);
           (yyval.asts) = NULL;
       } else {
           (yyval.asts) = newNode(RETURN,NULL,(yyvsp[(2) - (3)].asts));
       }
   }
    break;

  case 284:

/* Line 1806 of yacc.c  */
#line 1690 "SDCC.y"
    { (yyval.sym) = newSymbol ((yyvsp[(1) - (1)].yychar),NestLevel) ; }
    break;



/* Line 1806 of yacc.c  */
#line 4864 "SDCCy.c"
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
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

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 2067 of yacc.c  */
#line 1692 "SDCC.y"


