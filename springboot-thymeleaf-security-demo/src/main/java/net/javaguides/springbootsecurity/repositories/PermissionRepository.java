package net.javaguides.springbootsecurity.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import net.javaguides.springbootsecurity.entities.Permission;
import net.javaguides.springbootsecurity.entities.User;


/**
 * @author Ramesh Fadatare
 *
 */
public interface PermissionRepository extends JpaRepository<Permission, Integer>
{

	Optional<Permission> findByCode(String code);

}
