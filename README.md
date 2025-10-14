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

### 1. F13キー（CapsLock）の設定

F13キーショートカット機能を使用するには、CapsLockキーをF13として認識させる必要があります。

**レジストリを使った設定（推奨）:**

1. `CapsToF13.reg` ファイルを管理者として実行する
2. セキュリティ警告が表示されたら「はい」をクリックする
3. コンピュータを再起動する
4. 再起動後、CapsLockキーがF13として機能するようになります

**コマンドラインからのインストール:**
```cmd
regedit /s CapsToF13.reg
```

**コマンドの解説:**
- `regedit`: Windowsのレジストリエディタを起動するコマンド
- `/s`: サイレントモード（無音モード）でレジストリファイルをインポート
  - 通常の確認ダイアログを表示せずに自動実行
  - 管理者権限が必要（管理者としてコマンドプロンプトを実行してください）
- `CapsToF13.reg`: インポートするレジストリファイル
  - このファイルにはCapsLockキーをF13キーにマッピングする設定が含まれています

**アンインストール方法:**
1. `RestoreDefault.reg` ファイルを管理者として実行する
2. セキュリティ警告が表示されたら「はい」をクリックする
3. コンピュータを再起動する
4. 再起動後、キーボードが元の設定に戻ります

### 2. AutoHotkeyスクリプトの実行

1. **AutoHotkey v1.x** をインストールしてください
   * [AutoHotkey 公式サイト](https://www.autohotkey.com/) からダウンロード

2. `main.ahk` を実行してください
   * ダブルクリックで起動
   * タスクトレイに常駐します

3. 終了する場合はタスクトレイのアイコンを右クリックし、「Exit」をクリックしてください

## ファイル構成

```text
alt-ime-ahk/
├── main.ahk                           # メインスクリプト（統合版）
├── IME.ahk                            # IME制御ライブラリ（必要）
├── CapsToF13.reg                      # CapsLockをF13にマッピングするレジストリファイル
├── RestoreDefault.reg                 # キーボード設定を元に戻すレジストリファイル
├── README.md                          # 本ファイル
├── AGENTS.md                          # 開発ガイド
└── archives/                          # アーカイブフォルダ
    ├── original_alt-ime-only.ahk      # 元のalt-imeスクリプト（参考用）
    ├── 20251014_F13-shortcuts-only.ahk # F13ショートカット専用スクリプト（参考用）
    └── ArrowKeysRemap-V1.ahk          # ArrowKeysRemap互換の単機能版
```

## 技術的な詳細

### レジストリ設定について

このスクリプトは、Windows レジストリの以下のパスを変更します：

```
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout
```

スキャンコードマップの値は以下の通りです：

```
"Scancode Map"=hex:00,00,00,00,00,00,00,00,02,00,00,00,64,00,3a,00,00,00,00,00
```

これは次のような構造になっています：
- ヘッダー: 00,00,00,00,00,00,00,00
- エントリ数: 02,00,00,00（マッピング1個 + 終端マーカー）
- マッピング: 64,00,3a,00（F13[64] ← CapsLock[3A]）
- 終端マーカー: 00,00,00,00

### AutoHotkeyバージョンについて

このプロジェクトはAutoHotkey v1.x系で動作します。v2.x系には対応していません。

## JetBrains 製の IDE で使う場合は Tool Buttons をオンに

IntelliJ IDEA など JetBrains 製の IDE をお使いの方は「上部メニューバー　＞　View　＞　Tool Buttons」をオンにしてください。

オフのまま使うと Alt キーを離した際にスクリプトがエラー終了する場合があります。

## クレジット

このプロジェクトは以下をベースにしています：
* [karakaram/alt-ime-ahk](https://github.com/karakaram/alt-ime-ahk) - Alt-IME機能の元スクリプト
* カスタムF13キーショートカット機能を統合

## ブログの紹介ページ（元プロジェクト）

[Altの空打ちで日本語入力(IME)を切り替えるツールを作った](http://www.karakaram.com/alt-ime-on-off/)
