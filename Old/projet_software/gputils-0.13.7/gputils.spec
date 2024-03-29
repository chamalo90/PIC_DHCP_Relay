Name: gputils
Version: 0.13.7
Release: 1
Summary: Development utilities for Microchip (TM) PIC (TM) microcontrollers
License: GPL
Group: Development/Languages
Source: http://prdownloads.sourceforge.net/gputils/gputils-0.13.7.tar.gz
Packager: Craig Franklin <craigfranklin@users.sourceforge.net>
Vendor: Craig Franklin <craigfranklin@users.sourceforge.net>
Distribution: Red Hat Linux
URL: http://gputils.sourceforge.net
Buildroot: %{_tmppath}/%{name}-%{version}-root

%description
This is a collection of development tools for Microchip (TM) PIC (TM) 
microcontrollers.

This is ALPHA software: there may be serious bugs in it, and it's
nowhere near complete.  gputils currently only implements a subset of
the features available with Microchip's tools.  See the documentation for 
an up-to-date list of what gputils can do.

%prep
%setup

%build
./configure --prefix=/usr --mandir=/usr/share/man
make

%install
make DESTDIR="$RPM_BUILD_ROOT" install

%clean
[ ${RPM_BUILD_ROOT} != "/" ] && rm -rf ${RPM_BUILD_ROOT}

%files
%defattr(-, root, root)
%{_bindir}/gpasm
%{_bindir}/gpdasm
%{_bindir}/gplib
%{_bindir}/gplink
%{_bindir}/gpstrip
%{_bindir}/gpvc
%{_bindir}/gpvo
%{_mandir}/man1
%{_mandir}/fr/man1
%{_datadir}/gputils/header
%{_datadir}/gputils/lkr
%doc AUTHORS COPYING ChangeLog NEWS README 
%doc doc/gputils.pdf doc/gputils.ps
