#
#
#

SHELL           = /bin/sh


srcdir          = .
top_builddir    = .
top_srcdir      = .

include Makefile.common

SDCC_LIBS       = support/makebin
SDCC_DOC        = doc

# Parts that are not normally compiled but need to be cleaned
SDCC_EXTRA      = support/regression support/valdiag

SDCC_PACKIHX    = support/packihx
SDCC_LIBRARIAN  = support/librarian
SDCC_ASRANLIB   = as/asranlib

TARGETS         = sdcc-librarian sdcc-asranlib

ifeq ($(OPT_DISABLE_HC08), 0)
SDCC_ASLINK     += as/hc08 as/link/hc08
endif

ifeq ($(OPT_DISABLE_MCS51), 0)
SDCC_ASLINK     += as/mcs51 as/link/mcs51
SDCC_MISC       += debugger/mcs51
endif

ifeq ($(OPT_DISABLE_Z80), 0)
SDCC_ASLINK     += as/z80 as/asgb as/link
endif

ifeq ($(OPT_DISABLE_UCSIM), 0)
TARGETS         += sdcc-misc
SDCC_MISC       += sim/ucsim
PKGS            += $(SDCC_MISC)
endif

ifeq ($(OPT_DISABLE_DEVICE_LIB), 0)
TARGETS         += sdcc-device-lib
PKGS            += device/lib
endif

ifeq ($(OPT_DISABLE_PACKIHX), 0)
TARGETS         += sdcc-packihx
PKGS            += $(SDCC_PACKIHX)
endif

ifeq ($(OPT_ENABLE_DOC), 1)
TARGETS         += sdcc-doc
endif
# always install docs, which don't need to be built 
PKGS            += $(SDCC_DOC)

ifeq ($(OPT_DISABLE_SDCPP), 0)
SDCC_LIBS       += support/cpp
endif

TARGETS         += sdcc-libs sdcc-cc sdcc-device-inc sdcc-aslink

PKGS            += $(SDCC_LIBS) src device/include $(SDCC_ASLINK) $(SDCC_LIBRARIAN) $(SDCC_ASRANLIB)

PKGS_TINI       = $(SDCC_LIBS) $(SDCC_ASLINK) \
                  src device/include $(SDCC_PACKIHX) $(SDCC_LIBRARIAN)
PORTS           = $(shell cat ports.build)
ALLPORTS        = $(shell cat ports.all)

# Compiling entire program or any subproject
# ------------------------------------------
all: checkconf sdcc

tini: checkconf sdcc-tini

sdcc-libs:
	for lib in $(SDCC_LIBS); do $(MAKE) -C $$lib; done

sdcc-cc: sdcc-libs
	$(MAKE) -C src

sdcc-aslink:
	for as in $(SDCC_ASLINK); do $(MAKE) -C $$as ; done

sdcc-misc:
	for misc in $(SDCC_MISC); do $(MAKE) -C $$misc ; done

sdcc-packihx:
	$(MAKE) -C $(SDCC_PACKIHX)

sdcc-librarian:
	$(MAKE) -C $(SDCC_LIBRARIAN)

sdcc-asranlib:
	$(MAKE) -C $(SDCC_ASRANLIB)

sdcc-device-inc:
	$(MAKE) -C device/include

sdcc-device-lib: sdcc-cc sdcc-aslink
	$(MAKE) -C device/lib

sdcc-device-tini:
	$(MAKE) -C device/include
	$(MAKE) -C device/lib model-ds390 model-ds400

# doc depends on latex and latex2html
sdcc-doc:
	$(MAKE) -C doc

sdcc: $(TARGETS)

sdcc-tini: sdcc-librarian sdcc-asranlib sdcc-cc sdcc-aslink sdcc-device-tini sdcc-packihx
	$(MAKE) -f main.mk all

# Some interesting sub rules
sdcc-bin: sdcc-cc sdcc-aslink sdcc-misc

sdcc-base: sdcc-cc sdcc-aslink

# Compiling and installing everything and runing test
# ---------------------------------------------------
install:
	$(MAKE) -f main.mk install
	@for pkg in $(PKGS); do\
	  $(MAKE) -C $$pkg install ;\
	done

install-tini:
	$(MAKE) -f main.mk install
	@for pkg in $(PKGS_TINI); do\
	  $(MAKE) -C $$pkg install ;\
	done
	$(MAKE) -C device/lib install



# Deleting all the installed files
# --------------------------------
uninstall:
	$(MAKE) -f main.mk uninstall
	@for pkg in $(PKGS); do\
	  $(MAKE) -C $$pkg uninstall ;\
	done


# Deleting all files created by building the program
# --------------------------------------------------
clean:
	@echo "+ Cleaning root of the project..."
	$(MAKE) -f $(srcdir)/clean.mk clean
	@echo "+ Cleaning packages in their directories..."
	for pkg in $(PKGS); do\
	  $(MAKE) -C $$pkg PORTS="$(PORTS)" EXEEXT=$(EXEEXT) clean ;\
	done

# Deleting all files created by configuring or building the program
# -----------------------------------------------------------------
distclean:
	@echo "+ DistCleaning packages using clean.mk..."
	for pkg in $(PKGS); do\
	  $(MAKE) -C $$pkg PORTS="$(PORTS)" EXEEXT=$(EXEEXT) distclean ;\
	done
	for pkg in $(SDCC_EXTRA); do \
	  $(MAKE) -C $$pkg distclean; \
	done
	@echo "+ DistCleaning root of the project..."
	$(MAKE) -f $(srcdir)/clean.mk distclean

# Like clean but some files may still exist
# -----------------------------------------
mostlyclean: clean
	$(MAKE) -f $(srcdir)/clean.mk mostlyclean
	for pkg in $(PKGS); do\
	  $(MAKE) -C $$pkg PORTS="$(PORTS)" EXEEXT=$(EXEEXT) mostlyclean ;\
	done


# Deleting everything that can reconstructed by this Makefile. It deletes
# everything deleted by distclean plus files created by bison, stc.
# -----------------------------------------------------------------------
realclean: distclean
	$(MAKE) -f $(srcdir)/clean.mk realclean
	for pkg in $(PKGS); do\
	  $(MAKE) -C $$pkg PORTS="$(PORTS)" EXEEXT=$(EXEEXT) realclean ;\
	done


# Creating distribution
# ---------------------
dist: distclean
	@if [ -f devel ]; then\
	  rm -f devel; mkdist sdcc; touch devel;\
	else\
	  mkdist sdcc;\
	fi


# Performing self-test
# --------------------
check:


# Performing installation test
# ----------------------------
installcheck:


# Creating dependencies
# ---------------------
dep:
	$(MAKE) -f main.mk dep
	@for pkg in $(PKGS); do\
	  $(MAKE) -C $$pkg dep ;\
	done


# My rules
# --------
newer: distclean
	@if [ -f start ]; then \
	  tar cvf - \
	    `find . -newer start -type f -print` |\
	  gzip -9c >`date '+%m%d%H%M'`.tgz; \
	else \
	  echo "start file not found.\n"; \
	  exit 1; \
	fi

putcopyright:
	'put(c)' -s $(STARTYEAR) *.cc *.h *.y *.l


# Remaking configuration
# ----------------------
configure: configure.in
	$(SHELL) $(AUTOCONF)

main.mk: $(srcdir)/main_in.mk $(srcdir)/configure.in config.status
	$(SHELL) ./config.status

Makefiles: makefiles

makefiles: config.status

config.status: configure
	$(SHELL) ./config.status --recheck

makefiles:
	$(SHELL) ./config.status

freshconf: main.mk

checkconf:
	@if [ -f devel ]; then\
	  $(MAKE) freshconf;\
	fi

# End of Makefile
