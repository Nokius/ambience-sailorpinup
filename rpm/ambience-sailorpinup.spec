Name:       ambience-sailorpinup

Summary:    Sailor Pinup Ambience
Version:    0.0.1
Release:    1
Group:      System/GUI/Other
License:    TBD
Source0:    %{name}-%{version}.tar.bz2
BuildRequires:  qt5-qttools
BuildRequires:  qt5-qttools-linguist
BuildRequires:  qt5-qmake
Vendor: Nokius
Packager: Nokius

Requires:   ambienced

%description
This is a Sailor Pinup ambience.

%package ts-devel
Summary:   Translation source for template ambience
License:   TBD
Group:     System/GUI/Other

%description ts-devel
Translation source for %name

%prep
%setup -q -n %{name}-%{version}

%build

%qmake5

make %{?jobs:-j%jobs}

%install
rm -rf %{buildroot}
%qmake5_install

%files
%defattr(-,root,root,-)
%{_datadir}/ambience/%{name}
%{_datadir}/ambience/%{name}/%{name}.ambience
%{_datadir}/ambience/%{name}/sounds.index
%{_datadir}/ambience/%{name}/images/*
%{_datadir}/ambience/%{name}/sounds/*
%{_datadir}/translations/%{name}_eng_en.qm

%files ts-devel
%defattr(-,root,root,-)
%{_datadir}/translations/source/%{name}.ts

%post
systemctl-user restart ambienced.service

%changelog
* Wed Nov 26 2014 Nokius
- first release
