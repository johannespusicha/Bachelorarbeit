/*
THIS IS A GENERATED/BUNDLED FILE BY ROLLUP
if you want to view the source visit the plugins github repository
*/

'use strict';

var obsidian = require('obsidian');

/*! *****************************************************************************
Copyright (c) Microsoft Corporation.

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
***************************************************************************** */

function __awaiter(thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
}

class FocusMode extends obsidian.Plugin {
    constructor() {
        super(...arguments);
        this.focusModeActive = false;
        this.maximisedClass = "maximised";
        this.focusModeClass = "focus-mode";
        this.superFocusModeClass = "super-focus-mode";
    }
    storeSplitsValues() {
        // @ts-ignore
        this.leftSplitCollapsed = this.app.workspace.leftSplit.collapsed;
        // @ts-ignore
        this.rightSplitCollapsed = this.app.workspace.rightSplit.collapsed;
    }
    collapseSplits() {
        // @ts-ignore
        this.app.workspace.leftSplit.collapse();
        // @ts-ignore
        this.app.workspace.rightSplit.collapse();
    }
    restoreSplits() {
        if (!this.leftSplitCollapsed) {
            // @ts-ignore
            this.app.workspace.leftSplit.expand();
        }
        if (!this.rightSplitCollapsed) {
            // @ts-ignore
            this.app.workspace.rightSplit.expand();
        }
    }
    removeExtraneousClasses() {
        if (
        // @ts-ignore
        this.app.workspace.rootSplit.containerEl.hasClass(this.maximisedClass)) {
            // @ts-ignore
            this.app.workspace.rootSplit.containerEl.removeClass(this.maximisedClass);
            // @ts-ignore
            this.app.workspace.onLayoutChange();
        }
        if (document.body.classList.contains(this.superFocusModeClass)) {
            document.body.classList.remove(this.superFocusModeClass);
        }
    }
    enableSuperFocusMode() {
        // @ts-ignore
        this.app.workspace.rootSplit.containerEl.toggleClass(this.maximisedClass, 
        // @ts-ignore
        !this.app.workspace.rootSplit.containerEl.hasClass(this.maximisedClass));
        document.body.classList.toggle(this.superFocusModeClass, !document.body.classList.contains(this.superFocusModeClass));
        // @ts-ignore
        this.app.on("active-leaf-change", () => {
            try {
                // @ts-ignore
                this.app.workspace.activeLeaf.view.editor.blur();
                // @ts-ignore
                this.app.workspace.activeLeaf.view.editor.focus();
                // @ts-ignore
                this.app.workspace.activeLeaf.view.editor.refresh();
            }
            catch (ignore) { }
        });
        // @ts-ignore
        this.app.workspace.onLayoutChange();
        if (!document.body.classList.contains(this.focusModeClass)) {
            document.body.classList.add(this.focusModeClass);
        }
        this.collapseSplits();
        this.focusModeActive = true;
    }
    enableFocusMode() {
        this.removeExtraneousClasses();
        document.body.classList.toggle(this.focusModeClass, !document.body.classList.contains(this.focusModeClass));
        // @ts-ignore
        this.app.on("active-leaf-change", () => {
            try {
                // @ts-ignore
                this.app.workspace.activeLeaf.view.editor.blur();
                // @ts-ignore
                this.app.workspace.activeLeaf.view.editor.focus();
                // @ts-ignore
                this.app.workspace.activeLeaf.view.editor.refresh();
            }
            catch (ignore) { }
        });
        this.storeSplitsValues();
        this.collapseSplits();
        this.focusModeActive = true;
    }
    disableFocusMode() {
        this.removeExtraneousClasses();
        if (document.body.classList.contains(this.focusModeClass)) {
            document.body.classList.remove(this.focusModeClass);
        }
        this.restoreSplits();
        this.focusModeActive = false;
    }
    toggleFocusMode(superFocus = false) {
        if (superFocus) {
            this.enableSuperFocusMode();
        }
        else if (this.focusModeActive) {
            this.disableFocusMode();
        }
        else {
            this.enableFocusMode();
        }
    }
    onload() {
        return __awaiter(this, void 0, void 0, function* () {
            console.log("Loading Focus Mode plugin ...");
            this.addRibbonIcon("enter", "Toggle Focus Mode (Shift + Click to show active pane only)", (event) => {
                this.toggleFocusMode(event.shiftKey);
            });
            this.addCommand({
                id: "toggle-focus-mode",
                name: "Toggle Focus Mode",
                callback: () => {
                    this.toggleFocusMode();
                },
                hotkeys: [{ modifiers: ["Alt", "Mod"], key: "Z" }],
            });
            this.addCommand({
                id: "toggle-super-focus-mode",
                name: "Toggle Super Focus Mode (Active pane only)",
                callback: () => {
                    this.toggleFocusMode(true);
                },
                hotkeys: [{ modifiers: ["Alt", "Mod", "Shift"], key: "Z" }],
            });
        });
    }
    onunload() {
        console.log("Unloading Focus Mode plugin ...");
    }
}

module.exports = FocusMode;
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoibWFpbi5qcyIsInNvdXJjZXMiOlsibm9kZV9tb2R1bGVzL3RzbGliL3RzbGliLmVzNi5qcyIsIm1haW4udHMiXSwic291cmNlc0NvbnRlbnQiOm51bGwsIm5hbWVzIjpbIlBsdWdpbiJdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7O0FBQUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQXVEQTtBQUNPLFNBQVMsU0FBUyxDQUFDLE9BQU8sRUFBRSxVQUFVLEVBQUUsQ0FBQyxFQUFFLFNBQVMsRUFBRTtBQUM3RCxJQUFJLFNBQVMsS0FBSyxDQUFDLEtBQUssRUFBRSxFQUFFLE9BQU8sS0FBSyxZQUFZLENBQUMsR0FBRyxLQUFLLEdBQUcsSUFBSSxDQUFDLENBQUMsVUFBVSxPQUFPLEVBQUUsRUFBRSxPQUFPLENBQUMsS0FBSyxDQUFDLENBQUMsRUFBRSxDQUFDLENBQUMsRUFBRTtBQUNoSCxJQUFJLE9BQU8sS0FBSyxDQUFDLEtBQUssQ0FBQyxHQUFHLE9BQU8sQ0FBQyxFQUFFLFVBQVUsT0FBTyxFQUFFLE1BQU0sRUFBRTtBQUMvRCxRQUFRLFNBQVMsU0FBUyxDQUFDLEtBQUssRUFBRSxFQUFFLElBQUksRUFBRSxJQUFJLENBQUMsU0FBUyxDQUFDLElBQUksQ0FBQyxLQUFLLENBQUMsQ0FBQyxDQUFDLEVBQUUsQ0FBQyxPQUFPLENBQUMsRUFBRSxFQUFFLE1BQU0sQ0FBQyxDQUFDLENBQUMsQ0FBQyxFQUFFLEVBQUU7QUFDbkcsUUFBUSxTQUFTLFFBQVEsQ0FBQyxLQUFLLEVBQUUsRUFBRSxJQUFJLEVBQUUsSUFBSSxDQUFDLFNBQVMsQ0FBQyxPQUFPLENBQUMsQ0FBQyxLQUFLLENBQUMsQ0FBQyxDQUFDLEVBQUUsQ0FBQyxPQUFPLENBQUMsRUFBRSxFQUFFLE1BQU0sQ0FBQyxDQUFDLENBQUMsQ0FBQyxFQUFFLEVBQUU7QUFDdEcsUUFBUSxTQUFTLElBQUksQ0FBQyxNQUFNLEVBQUUsRUFBRSxN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
