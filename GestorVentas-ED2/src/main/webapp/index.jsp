<%@include file="libs/header.jsp" %>
<section class="vh-100" style="background: url('imgs/gamer.png') center center / cover no-repeat;">

    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/85ccbc77-4aa0-49a5-9be3-433766f15f9c/51461786-8ee3-40a5-8abc-b3dc73f59762.png"
                                 alt="login form" class="img-fluid w-100 h-100" style="border-radius: 1rem 0 0 1rem; object-fit: cover;" />
                        </div>

                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">

                                <form action="SvInicioSesion" method="POST">

                                    <div class="d-flex align-items-center mb-3 pb-1">
                                        <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                        <span class="h1 fw-bold mb-0">Logo</span>
                                    </div>

                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Ingrese a su cuenta</h5>

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <input type="email" name="correoIngresar" class="form-control form-control-lg" />
                                        <label class="form-label" for="form2Example17">Correo</label>
                                    </div>

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <input type="password" name="contraseniaIngresar" class="form-control form-control-lg" />
                                        <label class="form-label" for="form2Example27">Contraseña</label>
                                    </div>

                                    <div class="pt-1 mb-4">
                                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-lg btn-block" type="submit">Ingresar</button>
                                    </div>


                                </form>
                                <p class="mb-5 pb-lg-2" style="color: #393f81;">
                                    ¿No tiene cuenta? 
                                    <button type="button" 
                                            data-bs-toggle="modal" 
                                            data-bs-target="#exampleModalRegistrar" 
                                            style="background-color: transparent; border: none; color: #393f81; cursor: pointer; padding: 0;">
                                        Registrarse
                                    </button>
                                </p>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Modal para registrar un usuario -->
<div class="modal fade" id="exampleModalRegistrar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Registro</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="SvRegistrarUsuario" method="POST">
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombreRegistrar" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="email" name="emailRegistrar" required>
                    </div>
                    <div class="mb-3">
                        <label for="contrasenia" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" id="contrasenia" name="contraseniaRegistrar" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Guardar cambios</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="libs/foother.jsp" %>