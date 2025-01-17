# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.856474");
  script_version("2024-09-25T05:06:11+0000");
  script_cve_id("CVE-2024-34155", "CVE-2024-34156", "CVE-2024-34158");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2024-09-25 05:06:11 +0000 (Wed, 25 Sep 2024)");
  script_tag(name:"creation_date", value:"2024-09-13 04:00:37 +0000 (Fri, 13 Sep 2024)");
  script_name("openSUSE: Security Advisory for go1.22 (SUSE-SU-2024:3213-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=(openSUSELeap15\.6|openSUSELeap15\.5)");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2024:3213-1");
  script_xref(name:"URL", value:"https://lists.opensuse.org/archives/list/security-announce@lists.opensuse.org/thread/DHMLLZUAU3JK37745OCU5XWTW5Z4B4Y6");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'go1.22'
  package(s) announced via the SUSE-SU-2024:3213-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for go1.22 fixes the following issues:

  * Update go v1.22.7

  * CVE-2024-34155: Fixed stack exhaustion in all Parse* functions.
      (bsc#1230252)

  * CVE-2024-34156: Fixed stack exhaustion in Decoder.Decode. (bsc#1230253)

  * CVE-2024-34158: Fixed stack exhaustion in Parse. (bsc#1230254)

  ##");

  script_tag(name:"affected", value:"'go1.22' package(s) on openSUSE Leap 15.5, openSUSE Leap 15.6.");

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

if(release == "openSUSELeap15.6") {

  if(!isnull(res = isrpmvuln(pkg:"go1.22-doc", rpm:"go1.22-doc~1.22.7~150000.1.27.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"go1.22", rpm:"go1.22~1.22.7~150000.1.27.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"go1.22-race", rpm:"go1.22-race~1.22.7~150000.1.27.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "openSUSELeap15.5") {

  if(!isnull(res = isrpmvuln(pkg:"go1.22-doc", rpm:"go1.22-doc~1.22.7~150000.1.27.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"go1.22", rpm:"go1.22~1.22.7~150000.1.27.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"go1.22-race", rpm:"go1.22-race~1.22.7~150000.1.27.1", rls:"openSUSELeap15.5"))) {
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