# OpenVAS Vulnerability Test
# $
# Description: Auto generated from Gentoo's XML based advisory
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2008 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

include("revisions-lib.inc");
tag_insight = "GNU Gadu, CenterICQ, Kadu, EKG and libgadu are vulnerable to an integer
overflow which could potentially lead to the execution of arbitrary code
or a Denial of Service.";
tag_solution = "All GNU Gadu users should upgrade to the latest version:

    # emerge --sync
    # emerge --ask --oneshot --verbose '>=net-im/gnugadu-2.2.6-r1'

All Kadu users should upgrade to the latest version:

    # emerge --sync
    # emerge --ask --oneshot --verbose '>=net-im/kadu-0.4.1'

All EKG users should upgrade to the latest version:

    # emerge --sync
    # emerge --ask --oneshot --verbose '>=net-im/ekg-1.6_rc3'

All libgadu users should upgrade to the latest version:

    # emerge --sync
    # emerge --ask --oneshot --verbose '>=net-libs/libgadu-20050719'

All CenterICQ users should upgrade to the latest version:

    # emerge --sync
    # emerge --ask --oneshot --verbose '>=net-im/centericq-4.20.0-r3'

CenterICQ is no longer distributed with Gadu Gadu support, affected users
are encouraged to migrate to an alternative package.

http://www.securityspace.com/smysecure/catid.html?in=GLSA%20200507-26
http://bugs.gentoo.org/show_bug.cgi?id=99816
http://bugs.gentoo.org/show_bug.cgi?id=99890
http://bugs.gentoo.org/show_bug.cgi?id=99583";
tag_summary = "The remote host is missing updates announced in
advisory GLSA 200507-26.";

                                                                                

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.303976");
 script_version("$Revision: 6596 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:21:37 +0200 (Fri, 07 Jul 2017) $");
 script_tag(name:"creation_date", value:"2008-09-24 21:14:03 +0200 (Wed, 24 Sep 2008)");
 script_bugtraq_id(14345);
 script_cve_id("CVE-2005-1852");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("Gentoo Security Advisory GLSA 200507-26 (gnugadu centericq kadu ekg libgadu)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2005 E-Soft Inc. http://www.securityspace.com");
 script_family("Gentoo Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-gentoo.inc");

res = "";
report = "";
if ((res = ispkgvuln(pkg:"net-im/gnugadu", unaffected: make_list("ge 2.2.6-r1"), vulnerable: make_list("lt 2.2.6-r1"))) != NULL) {
    report += res;
}
if ((res = ispkgvuln(pkg:"net-im/centericq", unaffected: make_list("ge 4.20.0-r3"), vulnerable: make_list("lt 4.20.0-r3"))) != NULL) {
    report += res;
}
if ((res = ispkgvuln(pkg:"net-im/kadu", unaffected: make_list("ge 0.4.1"), vulnerable: make_list("lt 0.4.1"))) != NULL) {
    report += res;
}
if ((res = ispkgvuln(pkg:"net-im/ekg", unaffected: make_list("ge 1.6_rc3"), vulnerable: make_list("lt 1.6_rc3"))) != NULL) {
    report += res;
}
if ((res = ispkgvuln(pkg:"net-libs/libgadu", unaffected: make_list("ge 20050719"), vulnerable: make_list("lt 20050719"))) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
