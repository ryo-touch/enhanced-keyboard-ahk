; Alt-IME AutoHotkey Script with F13 Key Customization
;
; Features:
; - Left Alt key tap: Switch IME to English (OFF)
; - Right Alt key tap: Switch IME to Japanese (ON)
; - Alt + other keys: Normal Alt key behavior
; - F13 (CapsLock) + HJKL: Arrow keys navigation
; - F13 + other keys: Various shortcuts
; - US keyboard layout support for Dell Latitude 7340
;
; Author: Based on alt-ime-ahk by karakaram and custom F13 shortcuts

#Include IME.ahk

#InstallKeybdHook
#UseHook

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
#MaxHotkeysPerInterval 350

;====================================
; Alt-IME 機能のための主要キーパススルー設定
;====================================
; 主要なキーを HotKey に設定し、何もせずパススルーする
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
    Return

;====================================
; Alt-IME 機能
;====================================
; 上部メニューがアクティブになるのを抑制
*~LAlt::Send {Blind}{vk07}
*~RAlt::Send {Blind}{vk07}

; 左 Alt 空打ちで IME を OFF（英語入力）
LAlt up::
    if (A_PriorHotkey == "*~LAlt")
    {
        IME_SET(0)
    }
    Return

; 右 Alt 空打ちで IME を ON（日本語入力）
RAlt up::
    if (A_PriorHotkey == "*~RAlt")
    {
        IME_SET(1)
    }
    Return

;====================================
; F13 キーショートカット機能
;====================================
; F13(caps lockがプリントされているキー) + HJKL→矢印キー
F13 & H::Send,{Blind}{Left}
F13 & J::Send,{Blind}{Down}
F13 & K::Send,{Blind}{Up}
F13 & L::Send,{Blind}{Right}

; バックスペースとデリート
F13 & F::Send,{Backspace}
F13 & D::Send, {Del}

; 文頭と文末
F13 & A::Send,{Blind}{Home}
F13 & E::Send,{Blind}{End}

; 疑似ctrl化して、コピペ、全選択、保存ができるようにする
F13 & C::Send, ^c
F13 & X::Send, ^x
F13 & V::Send, ^v
F13 & S::Send, ^s
F13 & N::Send, ^n
F13 & b::Send, ^b
F13 & Z::Send, ^z
F13 & W::Send, ^w

; Caps + スペースでIME切り替え
; 左右の alt キーに慣れるため効かないようにしておく
; F13 & Space::Send, {vkF3sc029}

; F13 + スペースで半角スペース出力
F13 & Space::Send, {Space}

;====================================
; Dell Latitude 7340 キー修正
;====================================
; 変換キー（undefined）を本来の変換キーに戻す
; Dell Latitude 7340の場合、通常はsc079が変換キー
sc079::Send, {vkF2sc079}

; 無変換キー（undefined）を本来の無変換キーに戻す
; Dell Latitude 7340の場合、通常はsc07Bが無変換キー
sc07B::Send, {vk1Dsc07B}

; ¥キー（undefined）を`（バッククォート）キーに変更
; Dell Latitude 7340の場合、通常はsc07Dが¥キー
sc07D::Send, {``}
