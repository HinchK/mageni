# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.885818");
  script_version("2024-02-29T05:05:39+0000");
  script_cve_id("CVE-2024-25711");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2024-02-29 05:05:39 +0000 (Thu, 29 Feb 2024)");
  script_tag(name:"creation_date", value:"2024-02-27 02:03:44 +0000 (Tue, 27 Feb 2024)");
  script_name("Fedora: Security Advisory for diffoscope (FEDORA-2024-3383326db4)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC39");

  script_xref(name:"Advisory-ID", value:"FEDORA-2024-3383326db4");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/OUNBANAWD6TZH2NRRV4YUIAXEHLUJQ47");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'diffoscope'
  package(s) announced via the FEDORA-2024-3383326db4 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"diffoscope will try to get to the bottom of what makes files or directories
different. It will recursively unpack archives of many kinds and transform
various binary formats into more human readable form to compare them. It can
compare two tarballs, ISO images, or PDF just as easily. The differences can
be shown in a text or HTML report.

diffoscope is developed as part of the 'reproducible builds' Debian project and
was formerly known as 'debbindiff'.");

  script_tag(name:"affected", value:"'diffoscope' package(s) on Fedora 39.");

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

if(release == "FC39") {

  if(!isnull(res = isrpmvuln(pkg:"diffoscope", rpm:"diffoscope~257~1.fc39", rls:"FC39"))) {
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