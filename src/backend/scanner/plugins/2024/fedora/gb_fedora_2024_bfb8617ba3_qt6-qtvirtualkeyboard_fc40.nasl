# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.886951");
  script_version("2024-06-07T15:38:39+0000");
  script_cve_id("CVE-2024-36048");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2024-06-07 15:38:39 +0000 (Fri, 07 Jun 2024)");
  script_tag(name:"creation_date", value:"2024-06-07 06:34:53 +0000 (Fri, 07 Jun 2024)");
  script_name("Fedora: Security Advisory for qt6-qtvirtualkeyboard (FEDORA-2024-bfb8617ba3)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC40");

  script_xref(name:"Advisory-ID", value:"FEDORA-2024-bfb8617ba3");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/UCO6TJBNG7K4BMV3SZO2XI3HHJXFMH66");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'qt6-qtvirtualkeyboard'
  package(s) announced via the FEDORA-2024-bfb8617ba3 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"The Qt Virtual Keyboard project provides an input framework and reference keyboard
frontend
for Qt 6.  Key features include:

  * Customizable keyboard layouts and styles with dynamic switching.

  * Predictive text input with word selection.

  * Character preview and alternative character view.

  * Automatic capitalization and space insertion.

  * Scalability to different resolutions.

  * Support for different character sets (Latin, Simplified/Traditional Chinese, Hindi,
Japanese, Arabic, Korean, and others).

  * Support for most common input languages, with possibility to easily extend the language
support.

  * Left-to-right and right-to-left input.

  * Hardware key support for 2-way and 5-way navigation.

  * Handwriting support, with gestures for fullscreen input.

  * Audio feedback.");

  script_tag(name:"affected", value:"'qt6-qtvirtualkeyboard' package(s) on Fedora 40.");

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

  if(!isnull(res = isrpmvuln(pkg:"qt6-qtvirtualkeyboard", rpm:"qt6-qtvirtualkeyboard~6.7.1~1.fc40", rls:"FC40"))) {
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