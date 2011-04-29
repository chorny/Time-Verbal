#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Test::More;
use Test::Exception;
use Time::Verbal;
use utf8;
use encoding 'utf8';

my $now = time;

my $tv = Time::Verbal->new(locale => "zh_TW");
is $tv->distance($now, $now),      "不到一分鐘";
is $tv->distance($now, $now + 29), "不到一分鐘";
is $tv->distance($now, $now + 63), "一分鐘";
is $tv->distance($now, $now + 89), "一分鐘";
is $tv->distance($now, $now + 90), "2 分鐘";
is $tv->distance($now, $now + 119), "2 分鐘";
is $tv->distance($now, $now + 120), "2 分鐘";
is $tv->distance($now, $now + 3700), "大約一小時";
is $tv->distance($now, $now + 5400), "2 小時";
is $tv->distance($now, $now + 10800), "3 小時";
is $tv->distance($now, $now + 86405), "昨天";
is $tv->distance($now, $now + 86400 * 300), "300 天";
is $tv->distance($now, $now + 86400 * 600), "一年多";

done_testing;
