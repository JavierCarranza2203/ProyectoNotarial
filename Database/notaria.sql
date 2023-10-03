-- CREATE DATABASE proyecto_notarial_db;

-- CREATE TABLE clientes(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     nombre_de_pila VARCHAR(35),
--     apellido_materno VARCHAR(25),
--     apellido_paterno VARCHAR(25),
--     rfc VARCHAR(14),
--     curp VARCHAR(20),
--     correo VARCHAR(40)
-- );

-- CREATE TABLE usuarios(
--     nombre_de_usuario VARCHAR(15) PRIMARY KEY,
--     nombre_completo VARCHAR(80),
--     contrasenia VARCHAR(10)
-- );

CREATE TABLE tramites(
    folio VARCHAR(10) PRIMARY KEY,
    nombre_cliente VARCHAR(80),
    volumen VARCHAR(25),
    instrumento VARCHAR(25),
    nombre_empleado VARCHAR(80),
    fecha_creacion DATETIME
);

CREATE TABLE identificaciones_personas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    ine TEXT,
    curp TEXT,
    rfc TEXT
    folio_tramite VARCHAR(10),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio) ON DELETE CASCADE
);

CREATE TABLE documentos_personas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    acta_de_nacimiento TEXT,
    acta_de_matrimonio TEXT,
    comprobante_domicilio TEXT,
    recibo_agua TEXT,
    hoja_de_generales TEXT
    id_identificacion_persona INT,
    FOREIGN KEY (id_identificacion_persona) REFERENCES identificacion_persona(id) ON DELETE CASCADE
);

CREATE TABLE comparecientes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_documentos_persona INT,
    FOREIGN KEY (id_documentos_persona) REFERENCES documentos_persona(id) ON DELETE CASCADE
);

CREATE TABLE testigos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_documentos_persona INT,
    FOREIGN KEY (id_documentos_persona) REFERENCES documentos_persona(id) ON DELETE CASCADE
);

CREATE TABLE estructuras_archivos_1(
    id INT AUTO_INCREMENT PRIMARY KEY,
    escritura TEXT,
    certificado_con_reserva_de_prioridad TEXT,
    predial TEXT,
    id_compareciente INT,
    FOREIGN KEY (id_compareciente) REFERENCES comparecientes(id) ON DELETE CASCADE
);

CREATE TABLE estructuras_archivos_2(
    id INT AUTO_INCREMENT PRIMARY KEY,
    acta_de_nacimiento TEXT,
    acta_de_matrimonio TEXT,
    nombres_de_los_hijos TEXT,
    hoja_de_generales TEXT
    id_identificacion_persona INT,
    FOREIGN KEY (id_identificacion_persona) REFERENCES identificaciones_personas(id) ON DELETE CASCADE
);

CREATE TABLE estructuras_archivos_3(
    id INT AUTO_INCREMENT PRIMARY KEY,
    identificacion TEXT,
    hoja_de_generales TEXT
    folio_tramite VARCHAR(10),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio) ON DELETE CASCADE
);

CREATE TABLE estructuras_archivos_4(
    id INT AUTO_INCREMENT PRIMARY KEY,
    escritura TEXT,
    hoja_generales TEXT,
    id_identificacion_persona INT,
    FOREIGN KEY (id_identificacion_persona) REFERENCES identificaciones_personas(id) ON DELETE CASCADE
);

/**********************************************************
 *-- DOCUMENTOS QUE REQUIEREN A "estructuras_archivos_1" --*
***********************************************************/

CREATE TABLE contratos_de_compraventa(
    id_estructura_archios_1 INT,
    folio_tramite VARCHAR (10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_1) REFERENCES estructuras_arhivos_1(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE contratos_de_compraventa_con_reserva_de_dominio(
    id_estructura_archios_1 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_1) REFERENCES estructuras_arhivos_1(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE contratos_de_servidumbre_de_paso(
    id_estructura_archios_1 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_1) REFERENCES estructuras_arhivos_1(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE contratos_de_reconocimiento_de_adeudo_con_intereses_garantia_hipotecaria(
    id_estructura_archios_1 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_1) REFERENCES estructuras_arhivos_1(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE donaciones_gratuita_puras_simples(
    id_estructura_archios_1 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_1) REFERENCES estructuras_arhivos_1(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE donaciones_gratuitas_puras_simples_con_reserva_de_usufructo(
    id_estructura_archios_1 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_1) REFERENCES estructuras_arhivos_1(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE convenios_de_transmision_de_propiedad(
    poder TEXT,
    personalidad_de_la_empresa TEXT,
    id_estructura_archios_1 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_1) REFERENCES estructuras_arhivos_1(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

/***************************************************
 *-- DOCUMENTOS QUE REQUIEREN A "comparecientes" --*
****************************************************/

CREATE TABLE protocolizacion_de_acta_de_asamblea(
    acta_elaborada_por_la_empresa TEXT,
    poder TEXT,
    personalidad_de_la_empresa TEXT,
    id_compareciente INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_compareciente) REFERENCES comparecientes(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE protocolizacion_de_juicio_sucesorio(
    constancia_expedida_por_el_juzgado TEXT,
    certificado_con_reserva_de_prioridad TEXT,
    predial TEXT,
    id_compareciente INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_compareciente) REFERENCES comparecientes(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE protocolizacion_de_subdivision_fusion(
    dictamen_de_subdivision TEXT,
    predial TEXT,
    certificado_con_reserva_de_prioridad TEXT,
    id_compareciente INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_compareciente) REFERENCES comparecientes(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE usufructo_vitalicio(
    escritura TEXT,
    id_compareciente INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_compareciente) REFERENCES comparecientes(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE carta_responsiva(
    titulo_del_vehiculo TEXT,
    tarjeta_de_circulacion TEXT,
    id_compareciente INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_compareciente) REFERENCES comparecientes(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE acta_notarial(
    poder TEXT,
    id_compareciente INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_compareciente) REFERENCES comparecientes(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

/*********************************************
 *-- DOCUMENTOS QUE REQUIEREN A "testigos" --*
**********************************************/

CREATE TABLE declaracion_testimonial_sobre_el_estado_civil(
    acta_de_nacimiento TEXT,
    hoja_de_generales TEXT,
    id_testigo INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_testigo) REFERENCES testigos(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

/***********************************************************
 *-- DOCUMENTOS QUE REQUIEREN A "estructuras_archivos_2" --*
************************************************************/

CREATE TABLE testamento_publico_abierto_sencillo(
    id_estructura_archivos_2 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_2) REFERENCES estructuras_archivos_2(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE testamento_publico_abierto_con_legados(
    escrituras_propiedades TEXT,
    id_estructura_archivos_2 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_2) REFERENCES estructuras_archivos_2(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

/***********************************************************
 *-- DOCUMENTOS QUE REQUIEREN A "estructuras_archivos_3" --*
************************************************************/

CREATE TABLE escritos_aclaratorios_sobre_el_estado_civil(
    escritura TEXT,
    id_estructura_archivos_3 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_3) REFERENCES estructuras_archivos_3(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE escritos_aclaratorios_sobre_el_nombre(
    escritura TEXT,
    id_estructura_archivos_3 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_3) REFERENCES estructuras_archivos_3(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

/***********************************************************
 *-- DOCUMENTOS QUE REQUIEREN A "estructuras_archivos_4" --*
************************************************************/

CREATE TABLE cesion_de_derechos(
    id_estructura_archivos_4 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_4) REFERENCES estructuras_archivos_4(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE cancelacion_con_reserva_de_dominio(
    certificado_con_reserva_de_prioridad TEXT,
    id_estructura_archivos_4 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_4) REFERENCES estructuras_archivos_4(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE poder_especial_general(
    datos_de_la_empresa TEXT,
    acta_constitutiva TEXT,
    pdoer_del_representante TEXT,
    id_estructura_archivos_4 INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_4) REFERENCES estructuras_archivos_4(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

/********************************************************
 *-- DOCUMENTOS QUE REQUIEREN A "documentos_personas" --*
*********************************************************/

CREATE TABLE contratos_de_comodato(
    id_documentos_personas INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_documentos_personas) REFERENCES estructuras_archivos_4(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

CREATE TABLE contratos_de_arrendamiento(
    id_documentos_personas INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_documentos_personas) REFERENCES estructuras_archivos_4(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

/****************************************************************
 *-- DOCUMENTOS QUE REQUIEREN A "comparecientes" Y "testigos" --*
*****************************************************************/

CREATE TABLE contratos_de_compraventa_plazos(
    escritura TEXT,
    predial TEXT,
    id_compareciente,
    id_testigo,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_compareciente) REFERENCES comparecientes(id),
    FOREIGN KEY (id_testigo) REFERENCES testigos(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

/************************************************************************
 *-- DOCUMENTOS QUE REQUIEREN A "estructuras_archivos_3" Y "testigos" --*
*************************************************************************/

CREATE TABLE declaraciones_testimoniales_sobre_el_nombre(
    id_estructura_archivos_3 INT,
    id_testigo INT,
    folio_tramite VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (id_estructura_archivos_3) REFERENCES estructuras_archivos_3(id),
    FOREIGN KEY (id_testigo) REFERENCES testigos(id),
    FOREIGN KEY (folio_tramite) REFERENCES tramites(folio)
);

/***************************************************************************************
 *-- DOCUMENTOS QUE NO REQUIEREN SER RELACIONADOS CON OTRAS TABLAS APARTE DE TRAMITES--*
****************************************************************************************/