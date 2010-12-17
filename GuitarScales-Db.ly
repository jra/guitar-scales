%Copyright 2010 Jason Addison
%
%This file is part of guitar-scales.
%
%guitar-scales is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%
%guitar-scales is distributed in the hope that it will be useful,
%but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%GNU General Public License for more details.
%
%You should have received a copy of the GNU General Public License
%along with guitar-scales.  If not, see <http://www.gnu.org/licenses/>.

\version "2.10.0"
\header {
title = "Db Major Scales in Five Positions"
%arranger = "Jason Addison"
instrument = "Guitar"
tagline = "Engraved by Jason Addison using LilyPond"
}

\paper{
#(set-paper-size "letter")
#(define bottom-margin (* 2 cm))
page-count = 1
}

\layout {
  indent = 0.0\mm
%  ragged-right = ##t
}


uI = {
\key des \major
\voiceOne
%<c''\5_4>^\markup{XV} <d\4_1> <e\4_3> f\4_4 g\3_1 a\3_3 b\2_1 c\2_2 |
\transpose c des {
\relative c {
<c\5 e\4 g\3 c\2 e\1>1 |
\repeat volta 2 {
c8\5_4 d\4_1 e\4_3 f\4_4 g\3_1 a\3_3 b\2_1 c\2_2 |
d\2_4 e\1_1 f\1_2 g\1_4 f\1_2 e\1_1 d\2_4 c\2_2 |
b\2_1 a\3_3 g\3_1 f\4_4 e\4_3 d\4_1 c\5_4 b\5_3 |
a\5_1 g\6_4 f\6_2 e\6_1 f\6_2 g\6_4 a\5_1 b\5_3 | \break
}
<c\5 g'\4 c\3 e\2 g\1>1 |
\repeat volta 2 {
c8\5_2 d\5_5 e\4_1 f\4_2 g\4_4 a\3_1 b\3_3 c\3_4 |
d\2_1 e\2_3 f\2_4 g\1_1 a\1_3 g\1_1 f\2_4 e\2_3 |
d\2_1 c\3_4 b\3_3 a\3_1 g[\4_4 f\4_2 e\4_1 d]\5_5 |
\partial 4*3 c[\5_2 b\5_1 a\6_4 g]\6_2 a\6_4 b\5_1 | \break
}
<c\6 e\5 g\4 c\3 e\2 c'\1>1 |
\repeat volta 2 {
c8\6_4 d\5_1 e\5_3 f\5_4 g\4_1 a\4_4 b\3_1 c\3_2 |
d\3_4 e\2_1 f\2_2 g\2_4 a\1_1 b\1_3 c\1_4 b\1_3 |
a\1_1 g\2_4 f\2_2 e\2_1 d\3_4 c\3_2 b\3_1 a\4_4 |
\partial 4*2 g\4_1 f\5_4 e\5_3 d\5_1 | \break
}
<c\6 g'\5 c\4 e\3 g\2 c\1>1 |
\repeat volta 2 {
c8\6_2 d\6_4 e\5_1 f\5_2 g\5_4 a\4_1 b\4_3 c\4_4 |
d\3_1 e\3_3 f\3_4 g\2_1 a\2_3 b\1_1 c\1_2 b\1_1 |
a\2_4 g\2_2 f\3_4 e\3_3 d\3_1 c\4_4 b\4_3 a\4_1 |
\partial 4*2 g\5_4 f\5_2 e\5_1 d\6_4 | \break
}
%<c,\4 g'\3 c\2 e\1>1 |
<c'\4 g'\3 c\2 e\1>1 |
\repeat volta 2 {
c,8\6_1 d\6_3 e\6_4 f\5_1 g\5_3 a\5_4 b\4_1 c\4_2 |
d\4_4 e\3_1 f\3_2 g\3_4 a\2_1 b\2_3 c\2_4 d\1_1 |
e\1_3 f\1_4 e\1_3 d\1_1 c\2_4 b\2_3 a\2_1 g\3_4 |
f\3_2 e\3_1 d\4_4 c\4_2 b[\4_1 a\5_4 g\5_3 f]\5_1 |
\partial 4*1 e\6_4 d\6_3 | \break
}
}
}
}

%\context {
%\remove New_fingering_engraver
%}

Notation = \simultaneous { %% Combine both parts for notation
\time 4/4
\clef "G_8"
%\key aes \major
%\override Score.MetronomeMark #'padding = #6.0 \tempo 4=120
% \override StringNumber #'self-alignment-Y = #-1
%\override Score.StringNumber #'padding = #3.5
\set fingeringOrientations = #'(up left down)
%\override StringNumber #'transparent = ##t
\override Score.StringNumber #'stencil = ##f
<< \context Voice=VoiceA \uI >>
}

Tablature = \simultaneous { %% Combine both parts for Tablature
\time 4/4
\override TabStaff.Stem #'transparent = ##t %% Makes stems transparent
\override TabStaff.Beam #'transparent = ##t %% Makes beams transparent
<< \context TabVoice=TabVoiceA \uI >>
}


\score {
\context StaffGroup {
\simultaneous {
<< \context Staff=FullNotation \Notation >>
<< \context TabStaff=FullTab \Tablature >>
}
}
}

