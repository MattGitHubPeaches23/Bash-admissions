#!/bin/bash

#
# Unit tests for admissions.
#
# Copyright (c) 2019, Sekhar Ravinutala.
#

PATH=$PATH:.

. admissions.sh


# Test admissions()
test1() {
    assertEquals \
$'1763927\n'\
$'2355554\n'\
$'3556522\n'\
$'4098132\n'\
$'6010470\n'\
$'6449132\n'\
$'7917462\n'\
$'8542331\n'\
$'8997587\n'\
$'9754596' "$(admissions 10 | sort)"
  assertNull "$(admissions 100 | sort | diff 100 -)" 
}

# Test report.sh
test2() {
	assertEquals \
$'1062784\t3.95\t4.50\tNo\tNo\tNo\tM\n'\
$'1237664\t3.69\t4.80\tNo\tNo\tYes\tM\n'\
$'1254469	4.00	4.70	No	No	No	M\n'\
$'1264599	3.87	4.70	No	Yes	Yes	M\n'\
$'1361781	3.89	4.30	Yes	No	No	F\n'\
$'1506506	3.46	5.00	No	Yes	Yes	M\n'\
$'1660339	4.00	4.30	No	No	Yes	F\n'\
$'1663292	3.50	4.80	No	No	Yes	M\n'\
$'1697075	3.42	4.90	Yes	Yes	Yes	F\n'\
$'1763927	3.95	4.80	No	No	No	M\n'\
$'1788640	3.99	4.40	Yes	No	Yes	M\n'\
$'1906019	3.62	5.00	No	No	Yes	F\n'\
$'1976904	3.66	4.80	No	Yes	Yes	M\n'\
$'2029589	3.79	4.70	No	No	Yes	F\n'\
$'2268561	3.92	4.60	No	No	Yes	M\n'\
$'2313588	3.79	4.60	No	Yes	Yes	M\n'\
$'2338932	4.00	4.50	No	Yes	Yes	M\n'\
$'2355554	3.96	4.80	Yes	Yes	Yes	M\n'\
$'2385972	3.62	4.80	Yes	No	Yes	F\n'\
$'2449245	3.47	5.00	No	No	Yes	M\n'\
$'2547175	3.89	4.40	No	No	Yes	M\n'\
$'2669833	3.36	5.00	No	No	Yes	M\n'\
$'2984122	3.78	4.80	No	No	Yes	F\n'\
$'3021738	3.85	4.60	No	No	No	F\n'\
$'3238129	3.91	4.80	Yes	Yes	Yes	M\n'\
$'3499969	3.63	4.80	No	Yes	Yes	F\n'\
$'3500120	3.92	4.30	No	Yes	Yes	F\n'\
$'3553276	3.93	4.70	No	No	Yes	M\n'\
$'3556522	3.98	4.90	No	No	Yes	M\n'\
$'3820635	3.93	4.70	No	Yes	Yes	M\n'\
$'3871542	3.76	4.60	Yes	No	Yes	F\n'\
$'3922128	3.98	4.30	Yes	No	Yes	M\n'\
$'4062513	3.47	4.90	Yes	No	No	F\n'\
$'4098132	3.82	5.00	No	No	No	F\n'\
$'4356960	3.93	4.70	No	Yes	Yes	F\n'\
$'4402590	3.93	4.40	No	No	No	M\n'\
$'4431602	3.97	4.40	Yes	No	Yes	F\n'\
$'4498461	3.50	4.90	No	Yes	Yes	M\n'\
$'4527707	3.98	4.60	No	Yes	Yes	F\n'\
$'4691839	3.70	4.90	No	Yes	Yes	M\n'\
$'4697332	3.94	4.40	No	No	Yes	M\n'\
$'4730486	3.69	4.90	No	No	Yes	M\n'\
$'4753651	3.84	4.50	Yes	No	Yes	M\n'\
$'4964095	3.83	4.60	No	Yes	Yes	M\n'\
$'5063503	3.99	4.70	No	No	Yes	M\n'\
$'5066177	3.98	4.50	No	No	Yes	M\n'\
$'5080474	3.60	4.80	Yes	Yes	Yes	M\n'\
$'5164258	3.66	4.60	No	No	Yes	M\n'\
$'5193801	3.69	4.80	Yes	No	Yes	F\n'\
$'5223748	3.47	4.90	No	Yes	Yes	M\n'\
$'5256646	3.76	4.50	No	No	Yes	F\n'\
$'5374251	3.82	4.80	No	No	Yes	M\n'\
$'5396620	3.48	5.00	No	No	Yes	M\n'\
$'5411753	3.67	4.70	No	Yes	Yes	M\n'\
$'5544419	3.78	4.50	No	No	No	M\n'\
$'5600657	3.54	5.00	No	No	Yes	F\n'\
$'5617340	3.61	4.90	No	No	Yes	F\n'\
$'5625347	3.52	5.00	No	No	Yes	F\n'\
$'5711963	3.87	4.50	No	No	Yes	F\n'\
$'5754331	3.78	4.50	No	Yes	No	F\n'\
$'5908975	3.83	4.60	No	Yes	No	M\n'\
$'6010470	3.89	5.00	No	No	Yes	F\n'\
$'6076467	3.82	4.70	Yes	No	Yes	M\n'\
$'6347096	3.91	4.80	No	No	Yes	M\n'\
$'6449132	3.97	5.00	Yes	No	Yes	M\n'\
$'6519395	3.85	4.40	Yes	No	Yes	F\n'\
$'6526730	3.51	4.90	No	No	Yes	M\n'\
$'6649799	3.75	4.60	No	No	Yes	M\n'\
$'6803815	3.63	4.80	No	No	No	F\n'\
$'6847926	3.79	5.00	No	No	Yes	M\n'\
$'6991893	3.96	4.50	No	No	Yes	F\n'\
$'7158193	3.72	5.00	No	No	No	F\n'\
$'7236659	3.88	4.60	No	No	Yes	M\n'\
$'7541373	3.46	5.00	No	No	Yes	M\n'\
$'7787344	3.62	5.00	No	No	Yes	F\n'\
$'7847025	3.79	4.50	Yes	No	Yes	F\n'\
$'7917462	3.99	4.90	No	No	Yes	F\n'\
$'8024608	3.57	4.80	No	Yes	Yes	M\n'\
$'8079334	3.51	4.80	Yes	No	Yes	F\n'\
$'8148293	3.96	4.60	No	No	Yes	M\n'\
$'8297228	3.37	5.00	No	No	Yes	M\n'\
$'8350011	3.69	5.00	Yes	No	Yes	M\n'\
$'8400028	3.86	4.40	No	Yes	Yes	M\n'\
$'8461303	3.99	4.70	Yes	No	Yes	F\n'\
$'8542331	3.92	4.90	No	Yes	Yes	M\n'\
$'8568032	3.79	4.70	No	No	Yes	M\n'\
$'8866925	3.53	5.00	Yes	No	Yes	F\n'\
$'8905282	3.98	4.40	Yes	No	Yes	M\n'\
$'8917903	3.49	4.90	No	No	Yes	F\n'\
$'8954637	3.92	4.60	No	No	Yes	F\n'\
$'8969126	3.90	4.80	Yes	No	No	F\n'\
$'8997587	3.92	4.90	No	No	Yes	M\n'\
$'9156362	3.66	4.90	No	No	No	F\n'\
$'9591375	3.95	4.40	No	No	Yes	F\n'\
$'9629251	3.50	5.00	Yes	No	No	M\n'\
$'9738289	3.60	4.70	No	No	No	M\n'\
$'9751721	3.62	4.70	Yes	Yes	Yes	F\n'\
$'9754596	3.98	4.90	Yes	No	Yes	M\n'\
$'9757200	3.83	4.40	No	No	Yes	F\n'\
$'9928545	3.99	4.60	No	Yes	Yes	M'  "$(./report.sh 100)"
}

if [[ $(basename "$0") != "shunit2" ]]; then
    . $(which shunit2)
fi
