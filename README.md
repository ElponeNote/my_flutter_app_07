# my_flutter_app_07

## 프로젝트 개요
Flutter 웹 프로젝트를 Firebase Hosting과 GitHub Actions를 이용해 자동 배포하는 설정 과정을 기록합니다.

---

## 1. Firebase CLI 및 flutterfire CLI 설치

```bash
npm install -g firebase-tools
flutter pub global activate flutterfire_cli
```

- `firebase` 및 `flutterfire` 명령어가 정상 동작하는지 확인하세요.
- `flutterfire` 명령어가 PATH에 없을 경우:
  ```bash
  echo 'export PATH="\$PATH:\$HOME/.pub-cache/bin"' >> ~/.zshrc
  source ~/.zshrc
  ```

---

## 2. Firebase 로그인 및 프로젝트 연결

```bash
firebase login
firebase init hosting
```
- 기존 Firebase 프로젝트(`my-flutter-app-de94b`)와 연결
- Hosting public 디렉토리로 `build/web` 지정
- 싱글 페이지 앱(SPA) 설정: Yes

---

## 3. GitHub Actions 자동 배포 연동

- "Set up automatic builds and deploys with GitHub?" → Yes
- GitHub 저장소: `ElponeNote/my_flutter_app_07` 입력
- GitHub OAuth 권한 부여 필요 (조직/계정에 권한 허용)
- PR 머지 시 자동 배포: Yes
- 배포 전 빌드 스크립트: `flutter build web` 입력
- 라이브 채널 브랜치: `main` (기본값)

---

## 4. 생성된 설정 파일

- `.firebaserc` : Firebase 프로젝트 정보
- `firebase.json` : Hosting 및 기타 Firebase 서비스 설정
- `.github/workflows/firebase-hosting-*.yml` : GitHub Actions 워크플로우 파일

---

## 5. 배포 방법

### 1) 자동 배포
- 코드를 GitHub 저장소(`ElponeNote/my_flutter_app_07`)의 `main` 브랜치에 push하면,
  - GitHub Actions가 자동으로 `flutter build web`을 실행하고,
  - 빌드된 결과물을 Firebase Hosting에 자동 배포합니다.

### 2) 수동 배포
- 터미널에서 직접 배포하려면:
  ```bash
  flutter build web
  firebase deploy
  ```

---

## 6. 추가 참고 사항

- Firebase Hosting 사이트 주소는 Firebase 콘솔에서 확인할 수 있습니다.
- `.github/workflows/` 폴더에 생성된 워크플로우 파일을 확인해보세요.
- 필요하다면, `firebase.json` 등 설정 파일을 수정해 세부 옵션을 조정할 수 있습니다.

---

## 7. 추가 작업 예시

- Firestore, Auth 등 Firebase의 다른 서비스 연동 가능
- 배포 확인, 커스텀 도메인 연결 등

---

## 문의/참고
- 추가로 궁금한 점이나 하고 싶은 작업이 있다면 언제든 문의하세요!

---

> 이 문서는 Firebase Hosting 및 GitHub Actions 자동 배포 설정 과정을 기준으로 작성되었습니다. 실제 프로젝트 상황에 따라 일부 내용이 달라질 수 있습니다.
