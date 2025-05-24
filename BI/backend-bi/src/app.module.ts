import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';

import { AppController } from './app.controller';
import { AppService } from './app.service';

import { UsuariosModule } from './usuarios/usuarios.module';
import { PersonalModule } from './personal/personal.module';
import { GeneroModule } from './genero/genero.module';
import { DistritoModule } from './distrito/distrito.module';
import { EstadocivilModule } from './estadocivil/estadocivil.module';
import { TipoModule } from './tipo/tipo.module';
import { MailerModule } from './mailer/mailer.module';
import { EmailController } from './mailer/mailer.controller';
import { EstudiantesModule } from './estudiantes/estudiantes.module';
import { ProfesoresModule } from './profesores/profesores.module';
import { CarreraModule } from './carrera/carrera.module';
import { CategoriaModule } from './categoria/categoria.module';
import { AmbienteModule } from './ambiente/ambiente.module';
import { CursoModule } from './curso/curso.module';
import { TipocalificacionModule } from './tipocalificacion/tipocalificacion.module';
import { UnidadModule } from './unidad/unidad.module';
import { TiempoModule } from './tiempo/tiempo.module';
import { DesempeñoModule } from './desempeño/desempeño.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),

    TypeOrmModule.forRoot({
      type: 'mssql',
      host: process.env.DB_HOST,
      port: parseInt(process.env.DB_PORT),
      username: process.env.DB_USERNAME,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      entities: [__dirname + '/**/*.entity{.ts,.js}'],
      synchronize: true,
      options: {
        encrypt: true,
        trustServerCertificate: false,
      },
    }),

    // Todos tus módulos
    UsuariosModule,
    PersonalModule,
    GeneroModule,
    DistritoModule,
    EstadocivilModule,
    TipoModule,
    MailerModule,
    EstudiantesModule,
    ProfesoresModule,
    CarreraModule,
    CategoriaModule,
    AmbienteModule,
    CursoModule,
    TipocalificacionModule,
    UnidadModule,
    TiempoModule,
    DesempeñoModule,
  ],
  controllers: [AppController, EmailController],
  providers: [AppService],
})
export class AppModule {}
