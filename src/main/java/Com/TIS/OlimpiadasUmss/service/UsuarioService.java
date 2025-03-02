package Com.TIS.OlimpiadasUmss.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Com.TIS.OlimpiadasUmss.model.Usuario;
import Com.TIS.OlimpiadasUmss.repository.UsuarioRepository;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    // Crear un usuario
    public Usuario crearUsuario(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    // Obtener todos los usuarios
    public List<Usuario> obtenerTodosLosUsuarios() {
        return usuarioRepository.findAll();
    }

    // Obtener un usuario por ID
    public Optional<Usuario> obtenerUsuarioPorId(Long id) {
        return usuarioRepository.findById(id);
    }

    // Actualizar un usuario
    public Optional<Usuario> actualizarUsuario(Long id, Usuario usuario) {
        return usuarioRepository.findById(id).map(existingUser -> {
            existingUser.setUsername(usuario.getUsername());
            existingUser.setPassword(usuario.getPassword());
            existingUser.setEmail(usuario.getEmail());
            existingUser.setTelefono(usuario.getTelefono());
            existingUser.setRole(usuario.getRole());
            return usuarioRepository.save(existingUser);
        });
    }

    // Eliminar un usuario
    public boolean eliminarUsuario(Long id) {
        if (usuarioRepository.existsById(id)) {
            usuarioRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
