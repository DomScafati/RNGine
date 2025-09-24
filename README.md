# RNGine

A simple dice and coin-flip app for iPhone and Apple Watch.  
RNGine helps you roll dice (d20, d6, full D&D set) or flip a coin quickly.  
On Apple Watch, it defaults to a **d20** or **coin flip** for fast use.  
On iPhone, you can choose what to roll and see history.

---

## 🚀 Roadmap / Checklist

### Phase 1: Core Features (MVP)
- [ ] **Project Setup**
  - [x] Create a new Swift project (iOS + watchOS targets).
  - [ ] Set up basic app icon and placeholder UI.

- [ ] **Dice Rolling**
  - [x] Implement dice roll function (d20, d6, etc.).
  - [x] Display result in UI.
  - [ ] Add simple animation/feedback (e.g., haptic feedback, roll sound).

- [ ] **Coin Flip**
  - [x] Implement coin flip function.
  - [ ] Display heads/tails with icon or text.

- [ ] **Apple Watch App**
  - [ ] Create minimal Watch app target.
  - [ ] Default to d20 or coin flip.
  - [ ] Add simple tap-to-roll interface.

---

### Phase 2: Enhancements
- [ ] **Custom Dice Selection**
  - [ ] On iPhone: choose d4, d6, d8, d10, d12, d20, d100.
  - [ ] Save last selection for quick access.

- [ ] **History**
  - [ ] Show recent rolls/flips in a list.
  - [ ] Option to clear history.

- [ ] **Visual Polish**
  - [ ] Add custom dice/coin graphics.
  - [ ] Add haptics and/or animations to Watch app.

---

### Phase 3: Extended Goals
- [ ] **Magic Eight Ball Mode**
  - [ ] Create a random phrase generator.
  - [ ] Preload with classic "Magic Eight Ball" responses.
  - [ ] Option to customize/add user responses.

- [ ] **Customization**
  - [ ] Add ability to name dice sets or presets.
  - [ ] Add themes (light/dark dice, fantasy vs. modern look).

- [ ] **Social / Fun**
  - [ ] Share roll result via Messages/social.
  - [ ] Party mode: roll for multiple players at once.

---

## 🛠 Tech Stack
- **Language**: Swift
- **Frameworks**: SwiftUI, WatchKit
- **Platforms**: iOS + watchOS

---

## 📖 Notes
- Keep the Watch app **fast and minimal** — one tap = one roll.  
- The iPhone app can be the "controller" where you configure dice, view history, and access extra features.  
- Extended features (like **Magic Eight Ball Mode**) should not compromise the core: quick random generation.


