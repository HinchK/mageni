# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.9.2024.9939398898210298");
  script_cve_id("CVE-2023-40175", "CVE-2024-21647");
  script_tag(name:"creation_date", value:"2024-09-10 12:16:00 +0000 (Tue, 10 Sep 2024)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2023-08-24 18:48:29 +0000 (Thu, 24 Aug 2023)");

  script_name("Fedora: Security Advisory (FEDORA-2024-c393b8b2fb)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC40");

  script_xref(name:"Advisory-ID", value:"FEDORA-2024-c393b8b2fb");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2024-c393b8b2fb");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2134670");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2232729");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2235332");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2257340");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2257341");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'rubygem-puma' package(s) announced via the FEDORA-2024-c393b8b2fb advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Automatic update for rubygem-puma-6.4.2-1.fc40.

##### **Changelog**

```
* Tue Jan 9 2024 Vit Ondruch <vondruch@redhat.com> - 6.4.2-1
- Update to Puma 6.4.2.
 Resolves: rhbz#2134670
 Resolves: rhbz#2235332
 Related: rhbz#2232729
 Resolves: rhbz#2257341
 Related: rhbz#2257340

```");

  script_tag(name:"affected", value:"'rubygem-puma' package(s) on Fedora 40.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "FC40") {

  if(!isnull(res = isrpmvuln(pkg:"rubygem-puma", rpm:"rubygem-puma~6.4.2~1.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"rubygem-puma-debuginfo", rpm:"rubygem-puma-debuginfo~6.4.2~1.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"rubygem-puma-debugsource", rpm:"rubygem-puma-debugsource~6.4.2~1.fc40", rls:"FC40"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"rubygem-puma-doc", rpm:"rubygem-puma-doc~6.4.2~1.fc40", rls:"FC40"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

exit(0);
