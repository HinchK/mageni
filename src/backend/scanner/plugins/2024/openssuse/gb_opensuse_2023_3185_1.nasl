# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.833407");
  script_version("2024-04-16T05:05:31+0000");
  # TODO: No CVE assigned yet.
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2024-04-16 05:05:31 +0000 (Tue, 16 Apr 2024)");
  script_tag(name:"creation_date", value:"2024-03-04 07:23:47 +0000 (Mon, 04 Mar 2024)");
  script_name("openSUSE: Security Advisory for pipewire (SUSE-SU-2023:3185-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.4");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2023:3185-1");
  script_xref(name:"URL", value:"https://lists.opensuse.org/archives/list/security-announce@lists.opensuse.org/thread/57CZOK7UWKMULTLBJI4LPWFNDF34B5JC");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'pipewire'
  package(s) announced via the SUSE-SU-2023:3185-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for pipewire fixes the following security issues:

  * Fixed issue where an app which only has permission to access one stream can
      also access other streams (bsc#1213682).

  Bugfixes: - Fixed division by 0 and other issues with invalid values
  (glfo#pipewire/pipewire#2953) - Fixed an overflow resulting in choppy sound in
  some cases (glfo#pipewire/pipewire#2680)

  ##");

  script_tag(name:"affected", value:"'pipewire' package(s) on openSUSE Leap 15.4.");

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

if(release == "openSUSELeap15.4") {

  if(!isnull(res = isrpmvuln(pkg:"pipewire-modules", rpm:"pipewire-modules~0.3.24~150300.4.6.1", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pipewire-modules-debuginfo", rpm:"pipewire-modules-debuginfo~0.3.24~150300.4.6.1", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pipewire-modules-32bit-debuginfo", rpm:"pipewire-modules-32bit-debuginfo~0.3.24~150300.4.6.1", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pipewire-modules-32bit", rpm:"pipewire-modules-32bit~0.3.24~150300.4.6.1##", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pipewire-modules", rpm:"pipewire-modules~0.3.24~150300.4.6.1", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pipewire-modules-debuginfo", rpm:"pipewire-modules-debuginfo~0.3.24~150300.4.6.1", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pipewire-modules-32bit-debuginfo", rpm:"pipewire-modules-32bit-debuginfo~0.3.24~150300.4.6.1", rls:"openSUSELeap15.4"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"pipewire-modules-32bit", rpm:"pipewire-modules-32bit~0.3.24~150300.4.6.1##", rls:"openSUSELeap15.4"))) {
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