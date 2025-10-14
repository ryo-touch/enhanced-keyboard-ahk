#InstallKeybdHook
#UseHook

;autohotkeyの設定ファイル
;セミコロンでコメントアウト

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
F13 & Space::Send, {vkF3sc029}

; 変換キー（undefined）を本来の変換キーに戻す
; Dell Latitude 7340の場合、通常はsc079が変換キー
sc079::Send, {vkF2sc079}

; 無変換キー（undefined）を本来の無変換キーに戻す
; Dell Latitude 7340の場合、通常はsc07Bが無変換キー
sc07B::Send, {vk1Dsc07B}

; ¥キー（undefined）を`（バッククォート）キーに変更
; Dell Latitude 7340の場合、通常はsc07Dが¥キー
sc07D::Send, {``}
