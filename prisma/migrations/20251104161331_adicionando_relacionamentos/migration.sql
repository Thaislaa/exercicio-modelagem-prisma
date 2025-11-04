/*
  Warnings:

  - You are about to drop the column `prazoConclusao` on the `projeto` table. All the data in the column will be lost.
  - Added the required column `id_projeto` to the `tarefa` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "projeto" DROP COLUMN "prazoConclusao",
ADD COLUMN     "prazo_conclusao" DATE;

-- AlterTable
ALTER TABLE "tarefa" ADD COLUMN     "id_projeto" UUID NOT NULL,
ALTER COLUMN "urgente" SET DEFAULT false;

-- CreateTable
CREATE TABLE "usuario_projeto" (
    "id_usuario" UUID NOT NULL,
    "id_projeto" UUID NOT NULL,

    CONSTRAINT "usuario_projeto_pkey" PRIMARY KEY ("id_usuario","id_projeto")
);

-- AddForeignKey
ALTER TABLE "tarefa" ADD CONSTRAINT "tarefa_id_projeto_fkey" FOREIGN KEY ("id_projeto") REFERENCES "projeto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario_projeto" ADD CONSTRAINT "usuario_projeto_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuario_projeto" ADD CONSTRAINT "usuario_projeto_id_projeto_fkey" FOREIGN KEY ("id_projeto") REFERENCES "projeto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
