# alt-ime-ahk

## 概要

左右 Alt キーの空打ちで IME を OFF/ON する AutoHotKey スクリプトです。
F13キー（CapsLock）を使った各種ショートカット機能も統合されています。

### 主な機能

**Alt-IME機能:**
* 左 Alt キーの空打ちで IME を「英数」に切り替え
* 右 Alt キーの空打ちで IME を「かな」に切り替え
* Alt キーを押している間に他のキーを打つと通常の Alt キーとして動作

**F13キーショートカット機能:**
* F13 + HJKL → 矢印キー操作
* F13 + F/D → バックスペース/デリート
* F13 + A/E → Home/End（文頭/文末移動）
* F13 + C/X/V/S/N/B/Z/W → Ctrl+該当キー（コピー/切り取り/貼り付け/保存/新規/太字/元に戻す/閉じる）
* F13 + Space → IME切り替え

**US配列キーボード対応（Dell Latitude 7340）:**
* 変換/無変換キーの修正
* ¥キーを`（バッククォート）に変更

## 動作環境

* Windows 10/11
* AutoHotkey v1.x系

## 使い方

1. **AutoHotkey v1.x** をインストールしてください
   * [AutoHotkey 公式サイト](https://www.autohotkey.com/) からダウンロード

2. `main.ahk` を実行してください
   * ダブルクリックで起動
   * タスクトレイに常駐します

3. 終了する場合はタスクトレイのアイコンを右クリックし、「Exit」をクリックしてください

## ファイル構成

```text
alt-ime-ahk/
├── main.ahk                 # メインスクリプト（統合版）
├── IME.ahk                  # IME制御ライブラリ（必要）
├── README.md                # 本ファイル
├── AGENTS.md                # 開発ガイド
└── archives/                # アーカイブフォルダ
    ├── alt-ime-ahk.ahk      # 元のalt-imeスクリプト（参考用）
    └── 20251014_current.ahk # 統合前のF13キーカスタマイズスクリプト
```

## JetBrains 製の IDE で使う場合は Tool Buttons をオンに

IntelliJ IDEA など JetBrains 製の IDE をお使いの方は「上部メニューバー　＞　View　＞　Tool Buttons」をオンにしてください。

オフのまま使うと Alt キーを離した際にスクリプトがエラー終了する場合があります。

## クレジット

このプロジェクトは以下をベースにしています：
* [karakaram/alt-ime-ahk](https://github.com/karakaram/alt-ime-ahk) - Alt-IME機能の元スクリプト
* カスタムF13キーショートカット機能を統合

## ブログの紹介ページ（元プロジェクト）

[Altの空打ちで日本語入力(IME)を切り替えるツールを作った](http://www.karakaram.com/alt-ime-on-off/)
