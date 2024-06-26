# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.13.2024.040.01");
  script_cve_id("CVE-2018-16369", "CVE-2018-7453", "CVE-2022-36561", "CVE-2022-41844", "CVE-2023-2662", "CVE-2023-2663", "CVE-2023-2664", "CVE-2023-3044", "CVE-2023-3436");
  script_tag(name:"creation_date", value:"2024-02-12 04:20:23 +0000 (Mon, 12 Feb 2024)");
  script_version("2024-02-12T05:05:32+0000");
  script_tag(name:"last_modification", value:"2024-02-12 05:05:32 +0000 (Mon, 12 Feb 2024)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:N/I:N/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2023-05-17 00:41:27 +0000 (Wed, 17 May 2023)");

  script_name("Slackware: Security Advisory (SSA:2024-040-01)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Slackware Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/slackware_linux", "ssh/login/slackpack", re:"ssh/login/release=SLK(15\.0|current)");

  script_xref(name:"Advisory-ID", value:"SSA:2024-040-01");
  script_xref(name:"URL", value:"http://www.slackware.com/security/viewer.php?l=slackware-security&y=2024&m=slackware-security.436503");
  script_xref(name:"URL", value:"https://www.cve.org/CVERecord?id=CVE-2018-16369");
  script_xref(name:"URL", value:"https://www.cve.org/CVERecord?id=CVE-2018-7453");
  script_xref(name:"URL", value:"https://www.cve.org/CVERecord?id=CVE-2022-36561");
  script_xref(name:"URL", value:"https://www.cve.org/CVERecord?id=CVE-2022-41844");
  script_xref(name:"URL", value:"https://www.cve.org/CVERecord?id=CVE-2023-2662");
  script_xref(name:"URL", value:"https://www.cve.org/CVERecord?id=CVE-2023-2663");
  script_xref(name:"URL", value:"https://www.cve.org/CVERecord?id=CVE-2023-2664");
  script_xref(name:"URL", value:"https://www.cve.org/CVERecord?id=CVE-2023-3044");
  script_xref(name:"URL", value:"https://www.cve.org/CVERecord?id=CVE-2023-3436");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'xpdf' package(s) announced via the SSA:2024-040-01 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"New xpdf packages are available for Slackware 15.0 and -current to
fix security issues.


Here are the details from the Slackware 15.0 ChangeLog:
+--------------------------+
patches/packages/xpdf-4.05-i586-1_slack15.0.txz: Upgraded.
 This update fixes security issues:
 Fixed a bug in the ICCBased color space parser that was allowing the number
 of components to be zero. Thanks to huckleberry for the bug report.
 Fixed a bug in the ICCBased color space parser that was allowing the number
 of components to be zero. Thanks to huckleberry for the bug report.
 Added checks for PDF object loops in AcroForm::scanField(),
 Catalog::readPageLabelTree2(), and Catalog::readEmbeddedFileTree().
 The zero-width character problem can also happen if the page size is very
 large -- that needs to be limited too, the same way as character position
 coordinates. Thanks to jlinliu for the bug report.
 Add some missing bounds check code in DCTStream. Thanks to Jiahao Liu for
 the bug report.
 Fix a deadlock when an object stream's length field is contained in another
 object stream. Thanks to Jiahao Liu for the bug report.
 For more information, see:
 [link moved to references]
 [link moved to references]
 [link moved to references]
 [link moved to references]
 [link moved to references]
 [link moved to references]
 [link moved to references]
 [link moved to references]
 [link moved to references]
 [link moved to references]
 (* Security fix *)
+--------------------------+");

  script_tag(name:"affected", value:"'xpdf' package(s) on Slackware 15.0, Slackware current.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-slack.inc");

release = slk_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "SLK15.0") {

  if(!isnull(res = isslkpkgvuln(pkg:"xpdf", ver:"4.05-i586-1_slack15.0", rls:"SLK15.0"))) {
    report += res;
  }

  if(!isnull(res = isslkpkgvuln(pkg:"xpdf", ver:"4.05-x86_64-1_slack15.0", rls:"SLK15.0"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "SLKcurrent") {

  if(!isnull(res = isslkpkgvuln(pkg:"xpdf", ver:"4.05-i586-1", rls:"SLKcurrent"))) {
    report += res;
  }

  if(!isnull(res = isslkpkgvuln(pkg:"xpdf", ver:"4.05-x86_64-1", rls:"SLKcurrent"))) {
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
