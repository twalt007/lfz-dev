# Known Issues

If the development environment exhibits any systemic issues, we'll try to document them here.

## Unresponsive or Broken `phpMyAdmin` UI with JavaScript Errors

Sometimes, when a fresh `phpMyAdmin` installation is first signed into, there is a mountain of JavaScript XHR errors in the console. And they keep piling up while the page hangs and the UI becomes unresponsive and possibly broken looking.

This may occur because the browser has old cookies or session data that is not compatible with this version of `phpMyAdmin`. The following steps have been followed to solve the problem consistently and indefinitely.

1. Open the browser's Dev Tools and **Clear Storage** in the Application tab.
2. Return to the `phpMyAdmin` landing page (usually `/index.php`).
3. Restart the Apache web server to flush server-side caches.
4. Clear application storage in the browser again.
5. Sign into `phpMyAdmin`.

The problem should be fixed from here on out and shouldn't happen again unless another version of `phpMyAdmin` is accessed at the same origin in the same browser.

https://sourceforge.net/p/phpmyadmin/bugs/4949/#bd22
