#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.59)
AC_INIT([gputils],[0.13.7], [<URL:http://gputils.sourceforge.net/>])
AC_CONFIG_SRCDIR([config.h.in])
AC_CONFIG_HEADER([config.h])
AM_INIT_AUTOMAKE
AM_MAINTAINER_MODE

# Determine the host and build type. The target is always a PIC.
AC_CANONICAL_BUILD
AC_CANONICAL_HOST

# Defaults
GPUTILS_HEADER_PATH="\$(datadir)/gputils/header"
GPUTILS_LKR_PATH="\$(datadir)/gputils/lkr"
GPUTILS_LIB_PATH="\$(datadir)/gputils/lib"
LIBGPUTILS=libgputils/libgputils.a
LIBIBERTY=libiberty/libiberty.a
MAKE_SUBDIRS="libgputils libiberty gpasm gplink gputils header lkr doc man"

# Check for additional parameters
AC_ARG_ENABLE(debug, 
  [  --enable-debug          enable gputils debug features],
  [enable_gputils_debug=yes])    

AC_ARG_ENABLE(path,
  [  --disable-path          disable adding default search paths],
  [], [enable_gputils_path=yes])

# Checks for programs.
AC_PROG_CC
AC_PROG_YACC
AM_PROG_LEX
set `$LEX -V`
if test "${3}" != "2.5.4"; then
  AC_MSG_WARN(gputils supports flex version 2.5.4)
fi
AC_PROG_INSTALL

# append the host alias to the tools for cross compiling
AC_CHECK_TOOL(RANLIB, ranlib, :)
AC_CHECK_TOOL(AR, ar, :)

# Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS([libintl.h malloc.h stdlib.h string.h strings.h unistd.h windows.h])
AC_CHECK_DECLS([asprintf, basename, getopt, vasprintf])

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_TYPE_SIZE_T 
AC_STRUCT_TM

# Checks for library functions.
AC_CHECK_FUNCS([strcasecmp stricmp])

# Check for functions to compile into libiberty (getopt is always compiled).
IBERTYOBJS=
AC_CHECK_FUNC(bzero, , [IBERTYOBJS="$IBERTYOBJS bzero.o"])
AC_CHECK_FUNC(vsnprintf, , [IBERTYOBJS="$IBERTYOBJS vasprintf.o vsnprintf.o"])
AC_CHECK_FUNC(snprintf, , [IBERTYOBJS="$IBERTYOBJS snprintf.o"])

AM_CFLAGS=
AM_LDFLAGS=

# Options for the system on which the package will run
case "${host}" in
  *cygwin* )
    if test "x$GCC" = "xyes"; then
      AM_CFLAGS="-Wall -pedantic"
      AM_LDFLAGS="-Wl,-warn-common -Wl,-warn-once"
    fi
    ;;
  *linux* )
    if test "x$GCC" = "xyes"; then
      AM_CFLAGS="-Wall -pedantic"
      AM_LDFLAGS="-Wl,-warn-common -Wl,-warn-once"
    fi
    ;;
  *sun* )
    # sunos cc needs the -xCC flag for // comments
    if test "x$GCC" != "xyes"; then
      AM_CFLAGS="-xCC" 
    fi
    ;;
  *mingw* )
    ;;
  *-pc-os2_emx | *-pc-os2-emx )
    EXEEXT=".exe"
    if test "x$GCC" = "xyes"; then
      AM_CFLAGS="-Zcrtdll"
    fi
    ;;
esac

# Host filesystem options
case "${host}" in
  *mingw* | *-pc-os2_emx | *-pc-os2-emx | *djgpp* )
    AC_DEFINE(HAVE_DOS_BASED_FILE_SYSTEM, 1, 
      [Define if your host uses a DOS based file system. ])
    ;;
esac

# Process the options
if test x$enable_gputils_debug = xyes; then
  AC_DEFINE(GPUTILS_DEBUG, 1, 
    [Define if you want to enable GPUTILS debug features. ])
fi

if test x$enable_gputils_path = xyes; then
  AC_DEFINE(USE_DEFAULT_PATHS, 1, 
    [Define if you want to add default search paths. ])
fi

# Substitute configuration variables
AC_SUBST(AM_CFLAGS)
AC_SUBST(AM_LDFLAGS)
AC_SUBST(GPUTILS_HEADER_PATH)
AC_SUBST(GPUTILS_LKR_PATH)
AC_SUBST(GPUTILS_LIB_PATH)
AC_SUBST(IBERTYOBJS)
AC_SUBST(LIBGPUTILS)
AC_SUBST(LIBIBERTY)
AC_SUBST(MAKE_SUBDIRS)

# Generate Makefiles
AC_CONFIG_FILES([Makefile 
                 doc/Makefile 
                 gpasm/Makefile 
                 gplink/Makefile 
                 gputils/Makefile 
                 header/Makefile 
                 libgputils/Makefile 
                 libiberty/Makefile 
                 lkr/Makefile
                 man/Makefile 
                 man/fr/Makefile 
                 gputils.spec])

AC_OUTPUT

AC_MSG_RESULT([

gputils-$PACKAGE_VERSION is now configured for $canonical_host_type

  Build:                $build
  Host:                 $host
  Source directory:     $srcdir
  Installation prefix:  $prefix
  C compiler:           $CC $CFLAGS

])
