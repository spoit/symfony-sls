<?php

declare(strict_types=1);

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;

class DefaultController extends AbstractController
{
    public function index()
    {
        return (new JsonResponse(['ok']))
            ->setMaxAge(0)
            ->setSharedMaxAge(60);
    }
}
