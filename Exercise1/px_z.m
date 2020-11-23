function posterior = px_z(x,z)
    posterior = pz_x(z,x).*px(x)./pz(z);
end

