/*
  Warnings:

  - You are about to drop the column `emal` on the `Donation` table. All the data in the column will be lost.
  - Added the required column `email` to the `Donation` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Donation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "count" INTEGER NOT NULL,
    "displayName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "mobile" TEXT,
    "team" TEXT,
    "message" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Donation" ("count", "createdAt", "displayName", "id", "message", "mobile", "team") SELECT "count", "createdAt", "displayName", "id", "message", "mobile", "team" FROM "Donation";
DROP TABLE "Donation";
ALTER TABLE "new_Donation" RENAME TO "Donation";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
